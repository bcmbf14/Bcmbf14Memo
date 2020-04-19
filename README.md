# Bcmbf14Memo

___배운점과 추가로 공부해야될 부분들 정리___

# 

___프로젝트 생성___

![image](https://user-images.githubusercontent.com/60660894/79071861-e2718900-7d18-11ea-91ea-c0fe4e1842d8.png)

- Product Name
  - 프로젝트네임에는 단순명사(메모,날씨,카메라)등만 적으면 안된다.
  - 원하는 접두어, 접미어를 붙여서 최대한 고유하게 하는 것이 좋다. 
  - 영어 대소문자를 사용한다. 특수문자, 한글, 숫자 등은 적지 않는 것이 좋다.
  - 위의 사항을 어길시, 앱스토어에 앱을 등록 할 때 문제가 생길 수 있다.
 
- Oragnization Identifier 
  - 보통 역도메인 문자열을 입력하는데, 도메인이 없다면 이름을 공백없이 입력해도 좋다.
  
- Bundle Identifier
  - 앱을 유일하게 구별하는 __식별자__ 로 사용한다.

# 

___프로젝트 ___


![image](https://user-images.githubusercontent.com/60660894/79071930-46944d00-7d19-11ea-95ec-ba27a1ac85cf.png)

- Display Name
  - 앱스토어에 올라갈 앱의 이름이다. 기본적으로는 Product Name하고 동일하다. 한글을 입력해도 상관없고, 원하는대로 바꾸어도 된다.
  - 원하는 접두어, 접미어를 붙여서 최대한 고유하게 하는 것이 좋다. 
  
- Deployment Info - Target
  - 현재 iOS 10.0로 되어있는데 앱을 설치할 수 있는 소프트웨어의 최소 버전을 의미한다. 기본은 가장 최신버전으로 설정되어 있다. 
  - 보통은 최신버전에서 -2, -3 정도를 지정해준다. 
  - 설정이 iOS 10.0 으로 되어있다는 것은 아이폰에서 iOS 10.0 이상 버전이 설치된 기기에서는 앱을 다운로드 할 수 있다는 것을 의미한다. 

- Deployment Info - Target - Setting

![image](https://user-images.githubusercontent.com/60660894/79072071-ff5a8c00-7d19-11ea-954d-c6fe276acd8c.png)

  - iOS 10.0으로 설정하고 빌드하면 에러가 발생할 것이다. 이유는 iOS 13부터 SceneDelegate 클래스 등이 생겨났기 때문이다. 따라서 13이상 버전에서만 해당 코드가 동작하도록 처리해주어야 한다. 첫번째 fix를 눌러주면 `@available(iOS 13.0, *)` 이라고 표시된다. 
  - 컴파일러가 자동으로 에러를 표시해주는 기능을 Live Issue라고하고, 자동으로 수정해주는 기능을 Fix-it이라고 한다. 
  - Fix-it을 보면 Add @available to enclosing class / instance method 라고 되어있는데, 메소드마다 일일히 Fix-it해주기 귀찮으니까 아래 사진처럼 클래스에 한번에 지정해 줄 수도 있다. 
  
![image](https://user-images.githubusercontent.com/60660894/79072275-2c5b6e80-7d1b-11ea-8476-84994f3154e5.png)

- Signing 
  - 우리가 만든 앱을 디바이스에서 실행하거나, 앱스토어에 실행하고 싶다면 Signing이라는 과정이 필요하다.
  - 등록되지 않은 개발자가 앱을 설치하거나 해킹된 앱이 설치되지 않도록 하는 안전장치이다. 
  - 간혹 인터넷에서 다운로드한 프로젝트를 디바이스에서 실행할 수 없는 경우가 있는데, 아래 Bundle Identifier를 내가 사용하는 값으로 바꿔주면 된다. 

![image](https://user-images.githubusercontent.com/60660894/79072353-983dd700-7d1b-11ea-9071-3b7a7e97e02e.png)

# 

___App Icon___

![image](https://user-images.githubusercontent.com/60660894/79072564-a0e2dd00-7d1c-11ea-8c20-02e0df4c6606.png)

- 점선이 표시된 개별 사각형을 Image Well이라고 부른다.
- 밑에 20pt라고 되어있는 것은 이미지의 크기를 뜻하는 것이고 단위는 point이다. pixel과는 다른 단위이다.
- 2x, 3x라고 써있는 것은 상대적인 해상도를 뜻한다. 레티나 디스플레이가 적용되지 않은 버전은 1x, 레티나 2x, 레티나 HD/슈퍼 레티나 이상은 3x 라고 부른다. 
- 아이콘으로 작성할 이미지는 앱 아이콘이 정사각형에 코너가 약간 둥근 모양이기 때문에, 원형보다는 정사각형이 낫다. 
- 아이콘을 생성하고, 엄청나게 많은 이미지를 일일히 넣어줘야 한다. 번거롭긴 하다. 

[앱 아이콘 다운로드](https://www.flaticon.com/free-icon/compose_148876#term=pencil&page=1&position=18)

[아이폰 해상도 가이드](https://www.paintcodeapp.com/news/ultimate-guide-to-iphone-resolutions)

[무료 앱 아이콘 생성 사이트](https://appiconmaker.co/)


# 

___Memo Class___

```swift

import Foundation

class Memo {
    var content: String
    var insertData : Date
    
    init(content: String){
        self.content = content
        insertData = Date()
    }
    
    
    static var dummyMemoList = [
        Memo(content: "Lorem Ipsum"),
        Memo(content: "🥰 + 👍 = ❤️")
    
    ]
}

```

- 메모클래스를 생성했고, 더미데이터를 세팅했다. 
- 클래스기 때문에 생성자를 만들어주었고, 날짜형식같은경우는 기본 Date형식을 생성해서 넣어주면 되기 때문에 따로 생성자에 넣지 않았다. 


# 

___TableView DataSource___

테이블뷰를 구현하는데 단계가 필요하다. 
1. 테이블뷰 배치 
2. 프로토타입 셀 디자인, 셀 아이덴티파이어 지정
3. 데이터소스, 델리게이트 연결
4. 데이터소스 구현
5. 델리게이트 구현 


```swift
override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return Memo.dummyMemoList.count
}


override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

    // Configure the cell...
    let target = Memo.dummyMemoList[indexPath.row]
    cell.textLabel?.text = target.content
    cell.detailTextLabel?.text = formatter.string(from: target.insertData)
    return cell
}

```
# 

_전제조건은 이렇다._

> 테이블뷰는 바보다.

이게 무슨 말이냐면, 테이블뷰에는 필수 메소드인 위에 두 녀석이 있다. 그런데, TableView DataSource는 바보라서 내가 몇개의 셀을 그려야하는지, 셀의 디자인은 어떻게 생긴건지, 어떤 데이터를 넣어야하는지 알지 못한다.  
# 
따라서, 똑똑한 내가 그걸 알려줘야 한다. 그럼 데이터 소스는 그걸 어떻게 물어보나? 바로 저 메소드를 필수로 지정해놓고, 저 메소드를 호출해서 "이 메소드에 정답을 알려주세요~ 그러면 제가 그거 보고 그릴게요~" 라고 한다. 
# 
추가적으로 TableView Delegate 라는 녀석도 있는데, 이 녀석은 나중에 공부할거지만 얘는 그런 녀석이다. 데이터 소스가 데이터에 관한 정보를 담는 녀석이면 델리게이트는 이벤트에 관한 프로토콜이다. 몇번째 셀을 눌렀는지와 같은 것들 말이다. 따라서 눌러도 이벤트가 없다면 델리게이트를 구현하지 않아도 된다. 


# 

___DateFormatter___

원하는 날짜 형식을 사용하기 위해 DateFormatter 객체를 생성한다. 

```swift
let formatter: DateFormatter = {
    let f = DateFormatter()
    f.dateStyle = .long
    f.timeStyle = .short
    f.locale = Locale(identifier: "Ko_kr")
    return f
}()
```
속성을 나중에 넣어주는 것은 귀찮으므로 클로저로 만들어준다. 원하는 데이터 스타일과 시간스타일을 입력한다. 그리고 언어설정을 하지 않으면 기본언어인 영어로 선택이 되기 때문에 언어 설정도 지정해준다. 
# 
만들어 놓은 포매터를 사용하는 방법은 formatter.string(from: <Date>)에 넣어주면 되는데 아래와 같다. 
  
```swift
let target = Memo.dummyMemoList[indexPath.row]
cell.textLabel?.text = target.content
cell.detailTextLabel?.text = formatter.string(from: target.insertData)
return cell

```

# 

___***Add Memo, List Update___

재밌는게 있다. 어찌보면 매우 유의할 점이다. iOS13부터 프레젠트 모달 방식이 새로 생겼다. sheet 타입이다. 그래서 기존처럼 동작하게 하려면 따로 full screen 타입을 지정해주어야 한다.
# 
![image](https://user-images.githubusercontent.com/60660894/79151747-f646e900-7e05-11ea-9915-40c8ba71cd6a.png)
# 
그런데 문제가 되는 점은, 기존처럼 똑같이 작업을 하는데 

```swift

@IBAction func save(_ sender: Any) {

    guard let memo = memoTextView.text, memo.count > 0 else {
        alert(message: "메모를 입력하세요.")
        return
    }

    let newMemo = Memo(content: memo)
    Memo.dummyMemoList.append(newMemo)

    dismiss(animated: true, completion: nil)
}
    
```
위와 같이 메모를 추가해주는 action을 지정해도 모달 방식이 sheet 타입으로 지정되어 있으면 이전화면의 테이블뷰가 리로드 되지 않는다는 것이다.(save 메소드는 정상동작을 한다.) 또한, 초기설정에서 iOS 10.0까지 지원한다고 설정했음에도 불구하고 시뮬레이터를 ios 13이전의 버전(11.0~12.0처럼)으로 실행해보면 런치스크린 화면 후에 아래 사진과 같은 에러가 발생한다. 
# 
![image](https://user-images.githubusercontent.com/60660894/79151769-02cb4180-7e06-11ea-8f8f-fec22983a9eb.png)
![image](https://user-images.githubusercontent.com/60660894/79151796-14ace480-7e06-11ea-8225-f48fd549975c.png)
#
이유는 이렇다. 아래 코드처럼 우리는 SceneDelegate를 iOS 13.0 버전 이상에서만 실행하게 했고, 따라서 윈도우 객체가 생성되지 않은 것이다. 윈도우 객체가 없으니 아무런 화면도 보이지 않은 거지. 

```swift

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
```

그래서 아래처럼 AppDelegate에도 똑같이 윈도우 객체를 생성해주어야 한다. 

```swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
```

또한, 아직 해결되지 않은 프레젠트 모달방식으로 메모를 추가할 때 테이블뷰가 리로드 되지 않는 문제를 해결해야 한다. 여기서 문제의 핵심은 _save_ 메소드가 실행되지 않는게 아니다. 바로 페이지가 닫혀서 다시 이전 뷰컨트롤러로 돌아왔음에도 _viewWillAppear(:)_ 메소드가 불리지 않는다는 것이 핵심이다. 즉, 화면전환을 처리하는 방식이 달라졌다는 뜻이다. 이 문제는 노티피케이션으로 해결해야한다. 

1. 노티피케이션을 생성한다. 
```swift

extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    
}

```
2. 메모가 저장되서 뷰가 사라지기전에 노티피케이션을 송출한다. 
```swift

    @IBAction func save(_ sender: Any) {

        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요.")
            return
        }

        let newMemo = Memo(content: memo)
        Memo.dummyMemoList.append(newMemo)
        
        NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)
        
        dismiss(animated: true, completion: nil)
    }
    
```
3. 노티피케이션을 받을 뷰컨트롤러로 돌아가서 노티피케이션을 구독해준다.(마치 송출된 라디오의 주파수를 맞추는 느낌)
  - 그런데 여기서 중요한 점이 있다. 옵져버를 등록만하고 없애주지 않으면 메모리가 낭비된다. 따라서 노티피케이션을 해제하는 작업도 처리해주어야 한다. 
  - 노티피케이션을 구독하는 addObserver는 노티피케이션 구독을 해제할때 필요한 객체를 반환한다. NSObjectProtocol. 그걸 보통 토큰이라고 부른다. 
  - 그래서 우리는 token이라는 옵셔널 변수를 만들고 소멸자에서 토큰이 존재한다면 (노티가 살아있는거니까) removeObserver(token) 처리를 해준다. 
  - 이렇게되면, 해당 뷰컨트롤러가 메모리에서 사라질 때 노피티케이션도 구독해제되어 메모리 낭비가 없어질 것이다. 
```swift

    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ui작업이므로 메인쓰레드에서 작업해야 한다.
        //quere이후의 using작업이 quere에서 지정한 쓰레드에서 동작한다.
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDidInsert, object: nil, queue:   
        OperationQueue.main) { [weak self] (noti) in
            self?.tableView.reloadData()
        }
        
```


# 

___테이블뷰셀 동적높이조절___

기본적으로 테이블뷰의 디폴트셀을 만들게되면, 높이는 자동으로 조절이 되는 것 같다. 이것을 self-sizing cell이라고 한다. 내가 생각했던 것보다 공식문서가 진짜 어마무시하게 잘되어있다. 영어만 잘했어도 진짜.. 흐으.. 배움의 수준이 다를텐데. 어쨋건 영어야 하면 되는거고 여기에 [링크](https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/WorkingwithSelf-SizingTableViewCells.html#//apple_ref/doc/uid/TP40010853-CH25-SW1)가 있다. 공부를 하도록 하자. 

내가 생각하기엔 이게 커스텀셀에는 유효하지 않은 것 같고, iOS에서 제공해주는 기본 셀이라서 자동으로 체크가 되어있는 것 같다. 
![image](https://user-images.githubusercontent.com/60660894/79479798-41e8d500-8048-11ea-98e8-6ac5fb39e851.png)

일단 오토매틱으로 체크가 되어있으니, 레이블을 선택하고 attribute inspector에서 lines를 0으로 지정해주면 되겠다. 커스텀 셀을 사용할 때에는 오토레이아웃도 잘 잡아놔야 정상동작한다. 제약조건이 제대로 설정되어있지 않으면 컨텐츠의 크기에 맞게 셀의 높이가 동적으로 변경되지 않을 수 있다. 

# 

___LineBreakMode___

또 하나 배운게 이제 LineBreakMode인데, 굉장히 어떻게보면 디테일한 부분이다. 이름 그대로 레이블의 텍스트가 라인을 넘어가게되면 어떻게 처리해줄지에 관한 내용인데 ...을 앞에 해주거나 가운데해주거나 끝에해주거나같은 속성도 있고, 또 뭐 특정 단어에서 끝에 걸린다고하면 바로 줄바꿈을 해준다던지(word wrap)하는 속성이 있다. 해당 [링크](https://developer.apple.com/documentation/uikit/nslinebreakmode)에서 추가로 공부해보도록 하자. 


# 


___접기펼치기테스트___


<details markdown="1">
<summary>펼치기Show/접기Hide</summary>

### 여기다가 내용을 적으면 되나?
- 이렇게? 
- 이렇게?
  - 아니면 이렇게? 
# 

괜찮네..ㅎㅎ 

</details>


# 


___CoreData___

데이터를 저장할 떄, iOS에서는 CoreData를 사용하지요. 저도 이제껏 한번도 써본 적이 없는데 이번에 처음 써본?다긴보단 따라서 만들어봤습니다. 

프로젝트를 생성할 때, CoreData를 체크해주면 관련 메소드들이나 파일이 생겨납니다. 만약에 체크해주지 않았을 경우에는 NewFile에서 DataModel을 이라는 파일을 따로 생성해줘야해요. 그리고 persistentContainer 변수나 saveContext()같은 기본 메소드도 따로 구현해주어야 합니다. 

# 
데이터를 지정하려면 만든 name.xcdatamodeld에 들어가서 원하는 설계도를 설계하면 됩니다. ENTITIES에 기본은 entity라고 되어있는데 이걸 이름도 바꿔주고 속성을 지정해줍니다.
![image](https://user-images.githubusercontent.com/60660894/79617290-164a1580-8142-11ea-954d-374188ab8031.png)
유의할 점은 이렇게 만들어진 모델은 Class Definition이 됩니다. 따라서 이미 같은 이름의 클래스가 있다면 컴파일 에러가 발생하겠죠.

# 
아 그리고, 객체로 만든 entity는 삭제할 수 있습니다. 찾기가 제법 힘들지만 적어두도록 하겠습니다.
```

1. right click on the .xcdatamodel file
2. click "show in finder"
3. right click and "show package contents"
4. open file "contents" which is XML and delete the entity you don't want any more.

```
일단 이렇게 지정을 했으면 이걸 써야하는데, 보통 DataManager라고 따로 만들어서들 사용합니다.
그래서 따로 만들고, 아래와 같은 식으로 싱글톤으로 지정하죠. 그리고 나서는 SceneDelegate에서 코어데이터 저장관련 메소드를 싱글톤으로 따로 만들었기 떄문에 수정해줍니다. 해당 메소드는 가져오고, 불리는 방법만 바꿔주죠. 이 부분은 공부를 더 해야함. 

```swift

import Foundation
import CoreData


class DataManager {
    
    static let shared = DataManager()
    private init(){
        
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        // Save changes in the application's managed object context when the application transitions to the background.
        DataManager.shared.saveContext()
    }    
   
```

그리고 이제 기본으로 만들어지는 메소드를 한번 볼건데,, 음 뭔말인지는 잘 모르겠어요.     
persistentContainer라.. 집요한?계속머무르는?컨테이너라는데 그냥 어떤 상자가 있고 이제 그거를 로드해야되는데 로드가 안되면 에러나고 그런가봐요. 그리고 saveContext() 같은 경우에는 그렇게 만들어진 상자에서 context라는 데이터를 갖고있는데 이제 그걸 저장해주는 메소드다. 뭐 그렇게 간단하게 넘어갈게요. 

```swift

// MARK: - Core Data stack

     lazy var persistentContainer: NSPersistentContainer = {
      
         let container = NSPersistentContainer(name: "Bcmbf14Memo")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
       
                 fatalError("Unresolved error \(error), \(error.userInfo)")
             }
         })
         return container
     }()

     // MARK: - Core Data Saving support

     func saveContext () {
         let context = persistentContainer.viewContext
         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
             }
         }
     }

```

그러면 이제 진짜로 사용해볼건데, 컨텍스트라는걸 만들거에요. 따로 커스텀해서 만들수도 있다고는 합니다. 그 컨텍스트에서는 fetch라던지 그런 기본적인 기능들을 제공하지요. 
그리고 생성된 데이터를 담아놓을 memoList라는 배열을 만들거고 패치할 fetchMemo()메소드와 addNewMemo()메소드도 만들어줍니다. 

```swift

class DataManager {
    
    static let shared = DataManager()
    private init(){
        
    }
    
    var mainContext : NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    
    var memoList = [Memo]()
    
    func fetchMemo() {
        let request: NSFetchRequest<Memo> = Memo.fetchRequest()
        
        
        let sortByDateDesc = NSSortDescriptor(key: "insertDate", ascending: false)
        request.sortDescriptors = [sortByDateDesc]
        
        do {
            memoList = try mainContext.fetch(request)
        }catch {
            print(error)
        }
    }
    
    
    func addNewMemo(_ memo: String?){
        let newMemo = Memo(context: mainContext)
        newMemo.content = memo
        newMemo.insertDate = Date()
        
        
//        메모를 등록하고 다시 테이블뷰가 로드되는 과정에서 fetchMemo를 호출하는 방법도 있지만,
//        그것보다는 이렇게 배열에 추가해주는 것이 더 효율적이다. 날짜최신순이므로 append 대신 insert를 활용한다.
        memoList.insert(newMemo, at: 0)
        
        saveContext()
    }
    
```

주석에 적어놓았으니 대략 생략할건데, 기본적으로 제공되는 리퀘스트를 만들었고 데이터베이스에서는 기본적으로 정렬을 제공하지 않는다고해서 내림차순으로 정렬을 해주었고, 컨텍스트에 fetch라는 메소드를 이용해서 memoList에 데이터를 넣어주었습니다.
# 
저장같은 경우도 Memo라는 클래스가 이미 만들어져있어서 거기에 아까 만들어둔 컨텍스트를 넣고 거기의 컨텐츠로 파라미터로 들어온 데이터를 넣어줍니다. 그리고 저장하기위해 기본 메소드인 saveContext()를 사용합니다. 


# 


___메모 편집___

그리고 인상적이었떤 부분이 메모 편집부분인데, 나였으면 분명히 그냥 뷰컨트롤러 새로 만들었을 거임. 어려워서ㅋㅋ    
일단 시작해보면 음 iOS13부터 프레젠트모델 방식이 sheet타입이 새로 나왔지요. 그래서 지금 할일은 sheet타입의 모달을 pull down 했을 때, 메모를 저장할지 말지를 알랏창을 띄워주는 그런것들을 하려고 하지요. 

```
isModalInPresentation
A Boolean value indicating whether the view controller enforces a modal behavior.
```
위에 이녀석을 활용할겁니다. 설명하자면 풀다운 했을 때, 이녀석이 false면 뭐 원래그랬듯이 잘내려가고 true이면 뷰컨이 안닫히고 다 안내려가는거죠. 그리고 이것과 연결된 델리게이트인 UIAdaptivePresentationControllerDelegate의 presentationControllerDidAttemptToDismiss 메소드에서 어떤 일처리를 해주면 됩니다. 정확한 동작은 [예시링크](https://zeddios.tistory.com/831)가 있으니 참고. 

기능의 플로우는 아래와 같아요.
![image](https://user-images.githubusercontent.com/60660894/79618441-041da680-8145-11ea-95dd-8d6f53db1f7b.png)
원래 어 메모리스트가 있고, 우상단 Add를 누르면 새 메모 화면으로 갔고, 리스트를 누르면 메모를 읽을수만 있고 편집할 수 없는 화면으로 갔었지요. 근데 지금 할 일은 그 읽을수만 있는 화면 아래에 편집버튼(Compose)을 하나 만들고 그걸 탭하면 기존에 Add를 했던 화면에 내가 지금 가지고 있는 메모 데이터를 출력해서 수정할 수 있게 하려는 겁니다요. 

# 

DetailViewController에서는 prepare메소드를 이용해서 새 메모화면에 데이터를 세팅해줍니다. 그리고 편집해서 수정이 되었을때 다시 수정된 데이터를 보여주어야 하니까 노티를 받아서 데이터를 갱신해줍니다. 

```swift

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination.children.first as? ComposeViewController{
            vc.editTarget = memo
        }
    }

    
    var token: NSObjectProtocol?
    
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        token = NotificationCenter.default.addObserver(forName: ComposeViewController.memoDidChange, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            self?.memoTableView.reloadData()
        })
    }
    
```

그리고 기존 새 메모를 만들던 ComposeViewController에서는 일단 editTarget라는 변수를 만들어서 이 녀석이 존재하는지 안하는지에 따라 새 메모와 편집기능을 사용해야 하니까 분기처리를 해주지요. 또 노티도 각각 다르게 보냅니다. 또 위에서 설명했던 isModalInPresentation와 UITextViewDelegate의 textViewDidChange 메소드를 이용해서 현재 데이터와 수정된 데이터가 같은지 아닌지를 판별하고, 같으면 그냥 pull down이 되도록 처리하고 다르다면 데이터를 수정했다는거니까 pull down할때 얼랏창을 띄워서 (유저가 실수로 풀다운 할수도있는거니까) 이걸 데이터를 갱신할지 말지를 물어봅니다. 상황에 따라서는 이 메모데이터가 굉장히 중요한 데이터일수도 있는 거니까 말이지요. 

```swift 


import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo?
    var originalMemoContent: String?

    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var memoTextView: UITextView!
        
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "메모를 입력하세요.")
            return
        }
        
//        let newMemo = Memo(content: memo)
//        Memo.dummyMemoList.append(newMemo)
        
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)

        }else{
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDidInsert, object: nil)

        }

        
        
        
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        }else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        
    
        memoTextView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        편집화면이 실행되기 직전에 델리게이트 설정
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
//        편집화면이 사라지기 직전에 델리게이트 해제
        navigationController?.presentationController?.delegate = nil
    }
    

  
}


extension ComposeViewController {
    static let newMemoDidInsert = Notification.Name(rawValue: "newMemoDidInsert")
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
    
}



extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        
//        하려는 것
//        메모를 수정하고 풀다운 했을 때, 저장해야할지 물어보기
//        원본과 지금 고친메모가 다른지 판단
        if let original = originalMemoContent, let edited = textView.text {
            if #available(iOS 13.0, *) {
                //모달방식으로 동작해야하는지 결정하는 플래그
                //다르다면 속성에 트루가 저장
                isModalInPresentation = original != edited
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
}



extension ComposeViewController : UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidAttemptToDismiss(_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "확인", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default) { [weak self] (action) in
            self?.save(action)
        }
        
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in
            self?.close(action)
        }
        
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
}






# 

일단은.. 
1. achive 활성화 
2. 테스트플라이트 사용관련 모든것 https://dev-yakuza.github.io/ko/react-native/ios-testflight/
3. 아이콘 에러처리 https://gogorchg.tistory.com/entry/iOS-Error-ITMS90717-%E2%80%9CInvalid-App-Store-Icon%E2%80%9D
4. 수출규정 암호화 https://0urtrees.tistory.com/59 처리 







