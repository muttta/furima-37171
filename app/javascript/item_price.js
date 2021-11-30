window.addEventListener('load',() =>{
  const priceInput = document.getElementById("item-price")
  if (!priceInput){ return false;}
  priceInput.addEventListener("input", () => {
   const inputValue = priceInput.value;
   const addTaxDam = document.getElementById("add-tax-price")
   addTaxDam.innerHTML = Math.floor (inputValue * 0.1);
   const addProfitDam = document.getElementById("profit");
   addProfitDam.innerHTML = Math.floor (inputValue - Math.floor (inputValue * 0.1));
  })
});
