'use strict';
{
  const departmentList = {
    "人文学部": ["キリスト教学科", "人類文化学科", "心理人間学科", "日本文化学科"],
    "外国語学部": ["英米学科", "スペイン・ラテンアメリカ学科", "フランス学科", "ドイツ学科", "アジア学科"],
    "経済学部": ["経済学科"],
    "経営学部": ["経営学科"],
    "法学部": ["法律学科"],
    "総合政策学部": ["総合政策学科"],
    "理工学部": ["システム数理学科", "ソフトウェア工学科", "機械電子制御工学科"],
    "国際教養学部": ["国際教養学科"]
  };
  
  
  function createList() {
    const selectUndergraduate = document.getElementById("credit_undergraduate").value;
    const department = document.getElementById('credit_department');
    department.disabled = false;
    department.innerHTML = '';
  
    departmentList[selectUndergraduate].forEach( list => {
      const option = document.createElement('option');
      option.innerHTML = list;
      department.appendChild(option);
    });
  }
  document.getElementById("credit_undergraduate").onchange = createList;
  
}

  
