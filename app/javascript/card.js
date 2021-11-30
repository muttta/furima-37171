const pay = () => {
  Payjp.setPublicKey("pk_test_789cd3ffbb118a01ebf40492")
  const submit = document.getElementById("button")
  submit.addEventListener("click",(e) => {
    e.preventDefault();
    const formResult = document.getElementById('charge-form')
    const formData = new FormData(formResult)

    const card = {
      number: formData.get("user_payment[number]"),
      cvc: formData.get("user_payment[cvc]"),
      exp_month: formData.get("user_payment[exp_month]"),
      exp_year: `20${formData.get("user_payment[exp_year]")}`,
    };
    Payjp.createToken(card, (status,response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("chharge-form");
        const tokenObj = `<input value=${token} name='tokenObj' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("card_number").removeAttribute("name");
      document.getElementById("card_exp_month").removeAttribute("name");
      document.getElementById("card_exp_year").removeAttribute("name");
      document.getElementById("card_cvc").removeAttribute("name");
    })
  });
};

window.addEventListener("load", pay);