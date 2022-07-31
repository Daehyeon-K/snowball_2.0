export class Point {
  constructor(index, x, y) {
    // point에 index 값을 넘겨줘서 현재 point가 몇번째인지 확인
    // 웨이브 그리기 => 간격을 가진 좌표를 하나씩 만들어서 좌표의 Y값을 위아래로 이동시키고
    this.x = x; //   각각의 좌표를 하나의 선으로 연결하는 작업
    this.y = y;
    this.fixedY = y;
    this.speed = 0.01;
    this.cur = index; //curve
    this.max = Math.random() * 100 + 150;
  } 

  update() {
    this.cur += this.speed;
    this.y = this.fixedY + Math.sin(this.cur) * this.max;
    // sin 함수를 사용해여 아래위로 움직일 수 있도록 만들기
    // update() 함수를 실행하면 위아래로 이동
  }
}
