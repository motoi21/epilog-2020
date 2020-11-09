function count (){
  const description = document.getElementById("drawing_description");
  description.addEventListener("keyup",()=> {
    const textCount = description.value.length;
    const element = document.getElementById("text-length");
    element.innerHTML = `現在${textCount}/3000`;
  });
}
window.addEventListener("load", count);