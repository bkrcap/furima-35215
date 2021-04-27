window.addEventListener('load', function(){
  const sellingPrice = document.getElementById("item-price")
  
  sellingPrice.addEventListener("input", function(){
    const inputPrice = sellingPrice.value;
    
    const salesCommission = document.getElementById("add-tax-price");
    salesCommission.innerHTML = Math.floor(inputPrice * 0.1);

    const salesProfit = document.getElementById("profit");
    const value_result = inputPrice * 0.1
    salesProfit.innerHTML = Math.floor(inputPrice-value_result);
  })
})

