const price = () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      const inputValue = priceInput.value;
      console.log(inputValue);

      // ↓「販売手数料を表示する場所のid」に対応
      addTaxDom.innerHTML = Math.floor(inputValue * 0.1);

    });
  }
};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);