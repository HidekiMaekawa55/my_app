'user strict';

{
  const orders = document.querySelectorAll('.order a');
  orders.forEach( order => {
    order.removeAttribute("id", ".select_order");
  });
  
  const current_order = document.querySelector(".order a[href*='credits/full']");
  current_order.setAttribute("id","select_order"); 
}