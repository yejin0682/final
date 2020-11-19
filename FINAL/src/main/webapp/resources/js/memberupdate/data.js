
let userData = []

function handleData(){

    const ID = $('form')[0].ID.value
    const pw = $('form')[0].pw.value
    const name = $('form')[0].name.value
    const phonenum = $('form')[0].phonenum.value
    const zonecode = $('form)[0].zonecode.value
    const addr = $('form')[0].addr.value
    const addrdetail = $('form')[0].addrdetail.value
    const birth = $('form')[0].birth.value
    const job = $('form')[0].job.value
    const gender = $('form')[0].gender.value
    const email = $('form')[0].email.value
    const intro = $('form')[0].intro.value

    const userObj = {
      ID: ID,
      pw: pw,
      name : name,
      phonenum : phonenum,
      zonecode : zonecode,
      addr : addr,
      addrdetail : addrdetail,
      birth : birth,
      job:job,
      gender: gender,
      email:email,
      intro:intro
    }
    userData.push(userObj)

    console.log(userData)
    localStorage.setItem("userData", JSON.stringify(userData));


}