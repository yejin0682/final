
let productData = []

function handleData(){

    const pname = $('form')[0].pname.value
    const multiparts = $('form')[0].multiparts.value
    const price = $('form')[0].price.value
    const ID = $('form')[0].ID.value
    const auctionmenu = $('form')[0].auctionmenu.value
    const moneyup = $('form')[0].moneyup.value
    const deadlinedate = $('form')[0].deadlinedate.value
    const category = $('form')[0].category.value
    

    const productObj = {
      pname: pname,
      multiparts : multiparts,
      price : price,
      ID: ID,
      auctionmenu : auctionmenu,
      moneyup : moneyup,
      deadlinedate : deadlinedate,
      category: category
    }
    userData.push(productObj)

    console.log(productData)
    localStorage.setItem("productData", JSON.stringify(productData));


}