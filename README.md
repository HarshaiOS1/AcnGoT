# AcnGoT

Architecture: Clean archrtecture POC

//sample segrigation code
class Viewcontroller {
    let router: Router!
    let interactor: Interactor!
}

class Router {
    // multiple protocols to perform routing operation
}

class Interactor {
    let presenter: Presenter!
    let worker: DataWorker!
}

class Presenter {
//    pass data to vc using vc protocol
}

class DataWorker {
    // perform api calls
    // perfrom coredata operations
}

struct Models{
    // api response data models
}

<img width="590" alt="Screenshot 2024-07-26 at 08 28 09" src="https://github.com/user-attachments/assets/cac3f4f3-3bb5-49f3-ad65-49417d783746">


![](https://github.com/HarshaiOS1/AcnGoT/blob/main/ACNGoT/ACNGoT/Utils/ezgif.com-gif-maker.gif)
