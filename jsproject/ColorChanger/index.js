var colors=["white","green","yellow","pink","blue","red"]
var len=colors.length-1
var buttonControl=document.getElementById('btn')
var spanControl = document.querySelector('.color')

buttonControl.addEventListener('click',()=>{
   var index=generateRandomnumber()
   //console.log(index)

   document.body.style.backgroundColor=colors[index]
  spanControl.textContent=colors[index]
})
function generateRandomnumber(){
    return Math.round(Math.random()*len)
}