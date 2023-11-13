let text_arr = []
let count = 0

function get_value(item_id) {

    console.log(item_id.id);

    let text = item_id.textContent;
    console.log(text);

    if (text_arr.includes(text.trim())) {
        console.log("item is already added")
    } else {
        text_arr.push(text.trim());
        console.log("array is:" + text_arr)

        count += 1
        document.getElementById("skills_in").innerHTML += `
    <span id="span_item_${count}"> 
    ${text} 
    <button id="btn_item_${count}" class="btn_delete" onclick="delete_item(this.id)"><img src="./Images/cross.png" alt=""></button>
    </span>
    `
    }
}



function delete_item(id){
    // console.log(document.getElementById(`${id}`).parentNode)
    // console.log(document.getElementById(`${id}`).parentNode.firstChild)
    let x = document.getElementById(`${id}`).parentNode.firstChild.textContent.trim();
    // console.log(x)
    text_arr = text_arr.filter(e => e !== x);

    document.getElementById(`${id}`).parentNode.remove();
    
}



document.addEventListener("DOMContentLoaded", function () {

    let list = document.getElementById("btn_menu");
    console.log(list)

    list.addEventListener("click", function () {
        document.getElementById("skills_item").classList.toggle("display_item");
        //working on toggle the img from down to up....
    })


});

