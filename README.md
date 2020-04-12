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
