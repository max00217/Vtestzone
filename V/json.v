import json

struct User {
    name string
    age  int
    gender string
mut:
    is_registered bool
}

fn main() {
    s := '[
        {"name":"Frodo", "age":25, "gender": "male"}, 
        {"name":"Bobby", "age":10, "gender": "male"},
        {"name":"Sally", "age":12, "gender": "female"},
        {"name":"Max", "age":17, "gender": "male"},
        {"name":"Jane", "age":19, "gender": "female"}
        ]'

    mut users := json.decode([]User, s) or {
        eprintln("Failed to parse json")
        return
    }

    println("List of users:\n")
    for user in users {
        println("${user.name}: ${user.age}, ${user.gender}")
    }

    println("====================\n")
    
    for i, mut user in users {
        println("\n${i+1}) ${user.name}")

        if user.isgendermale() {
            println("${user.name} is Male")
        } else {
            println("$user.name is Female")
        } 
        if !user.can_register() {
            if user.isgendermale() {
                println("---Cannot register ${user.name}, he is too young---")
            } else {
                println("---Cannot register ${user.name}, she is too young---")
            }
            continue
        }
        user.register()
           // `user` is declared as `mut` in the for loop,
        		// modifying it will modify the array
    }

    println("====================")
    println("\nAfter registering all users:\n")

    for mut user in users {
        if user.is_registered {
            println("${user.name} is registered\n")
        } else {
            println("${user.name} is not registered\n")
        }
    }

    println("====================")
    println(json.encode(users))     // Let"s encode users again just for fun
}

fn (u User) can_register() bool {
    return u.age >= 16
}

fn (u User) isgendermale() bool {
    return u.gender == "male"
}

fn (mut u User) register() {
    u.is_registered = true
}