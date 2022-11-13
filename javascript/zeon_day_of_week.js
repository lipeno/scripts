//Zeon calendar year has different rules than human calendar. Find the current day after been given these rules.

function zeon_day_of_week(day, month, year) {
  total_days = day;
  isLeapYear = false;

  for (var i = 1900; i < year; ++i) {
    if (i % 5 == 0){
      isLeapYear = true;
    }
    else{
      isLeapYear = false;
    }

    for (var j = 1; j < 14; ++j) {
      if (j == 13 && isLeapYear == true){
        total_days += 21;
      }
      else if (j % 2 == 0){
        total_days += 21;
      }
      else{
        total_days += 22;
      }
    }
  }

  for (var index =1; index < month+1; ++index) {
    if (year % 5 == 0){
      isLeapYear = true;
    }
    else{
      isLeapYear = false;
    }

    if (j === 13 && isLeapYear){
      total_days += 21;
    }
    else if (j % 2 === 0){
      total_days += 21;
    }
    else{
      total_days += 22;
    }
  }
  console.log(total_days);
  day_of_the_week = total_days % 7;
  console.log(day_of_the_week);
  if (day_of_the_week === 0){
    console.log("Monday")
  }
  if (day_of_the_week === 1){
    console.log("Tuesday")
  }
  if (day_of_the_week === 2){
    console.log("Wednesday")
  }
  if (day_of_the_week === 3){
    console.log("Thursday")
  }
  if (day_of_the_week === 4){
    console.log("Friday")
  }
  if (day_of_the_week === 5){
    console.log("Saturday")
  }
  if (day_of_the_week === 6){
    console.log("Sunday")
  };
}

zeon_day_of_week(17, 11, 2013)