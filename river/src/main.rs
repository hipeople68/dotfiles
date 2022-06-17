use std::process::Command;
fn main() {
    //spawn terminal (kitty in this case)
    Command::new("riverctl").arg("map").arg("normal").arg("super").arg("return").arg("spawn").arg("kitty")
        .spawn()
        .expect("error 1");

    //layout generator
    Command::new("riverctl").arg("spawn").arg("rivertile")
        .spawn()
        .expect("error 2");

    //keybind deamon
    Command::new("swhks").arg("&")
        .spawn()
        .expect("error 3");
    Command::new("pkexec").arg("swhkd")
        .spawn()
        .expect("error 4");

    //set wallpaper
    Command::new("oguri")
        .spawn()
        .expect("error 5");
    
    //startup programs
}
