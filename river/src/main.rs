use std::process::Command;
fn main() {
    //spawn terminal (kitty in this case)
    Command::new("riverctl")
        .arg("map")
        .arg("normal")
        .arg("super")
        .arg("return")
        .arg("spawn")
        .arg("kitty")
        .spawn()
        .expect("error");

    //set wallpaper
    Command::new("oguri")
        .spawn()
        .expect("error");
}
