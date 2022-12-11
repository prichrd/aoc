#!/bin/awk -f

func eval_operation(str, old) {
  delete sp;
  split(str, sp, " ");
  v = sp[5];
  if (v == "old") {
    v=old;
  }
  if (sp[4] == "*") {
    return old * v;
  } else if (sp[4] == "+") {
    return old + v;
  }
  print("NOT IMPLEMENTED");
}

func push_item(monkey_item_count, monkey_items, monkey_id, item) {
  monkey_items[monkey_id "," monkey_item_count[monkey_id]]=item
  monkey_item_count[monkey_id]++;
}

func pop_item(monkey_item_count, monkey_items, monkey_id) {
  item = monkey_items[monkey_id "," 0]
  for (i=1; i<monkey_item_count[monkey_id]; i++) {
    monkey_items[monkey_id "," i-1] = monkey_items[monkey_id "," i]
  }
  delete monkey_items[monkey_id "," monkey_item_count[monkey_id]];
  monkey_item_count[monkey_id]--;
  return item
}

$1 == "Monkey" { gsub(":", "", $2); monkey_id=$2; monkeys++; monkey_item_count[monkey_id] = 0; next; }
$1 == "Starting" {
  for(i=3; i<=NF; i++) {
    gsub(",", "", $i);
    push_item(monkey_item_count, monkey_items, monkey_id, $i)
  }
  next;
}
$1 == "Operation:" {
  op = ""
  for(i=2; i<=NF; i++) {
    op = op " " $i
  }
  monkey_operation[monkey_id] = op;
  next;
}
$1 == "Test:" {
  monkey_test[monkey_id] = $4;
  next;
}
$1 == "If" && $2 == "true:" {
  monkey_test_true_recipient[monkey_id] = $6;
  next;
}
$1 == "If" && $2 == "false:" {
  monkey_test_false_recipient[monkey_id] = $6;
  next;
}

END {
  common_divisor = 1;
  for (k in monkey_test) {
    common_divisor *= monkey_test[k]
  }

  for (round=1; round<=10000; round++) {
    for (monkey_id=0; monkey_id<monkeys; monkey_id++) {
      while (monkey_item_count[monkey_id]>0) {
        inspects[monkey_id]++;
        worry_level = pop_item(monkey_item_count, monkey_items, monkey_id)
        iwl=worry_level
        worry_level = eval_operation(monkey_operation[monkey_id], worry_level);
        worry_level = int(worry_level);

        recipient = monkey_test_false_recipient[monkey_id];
        if (worry_level % monkey_test[monkey_id] == 0) {
          recipient = monkey_test_true_recipient[monkey_id];
        }

        if (worry_level > common_divisor) {
          worry_level = worry_level % common_divisor
        }

        push_item(monkey_item_count, monkey_items, recipient, worry_level)
      }
    }
  }

  asort(inspects, sorted);
  print(sorted[monkeys]*sorted[monkeys-1])
}

