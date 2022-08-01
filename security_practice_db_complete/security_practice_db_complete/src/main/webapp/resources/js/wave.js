import { Point } from "./point.js";

export class Wave {
  constructor(index, totalPoints, color) {
    // 웨이브에 번호를 매겨서 각각 다르게 움직이게 조정
    this.index = index;
    this.totalPoints = totalPoints;
    this.color = color;
    this.points = [];
  }

  resize(stageWidth, stageHeight) {
    this.stageWidth = stageWidth;
    this.stageHeight = stageHeight;

    this.centerX = stageWidth / 2; // 웨이브를 중앙에서 띄울 것이기 때문에 center를 stage의 중간값으로 지정
    this.centerY = stageHeight / 2;

    this.pointGap = this.stageWidth / (this.totalPoints - 1); // point의 간격 = 스테이지에서 총 포인트를 나눈 값

    this.init();
    // 애니메이션을 만들 때 가장 중요한 것은 그리고자 하는 애니메이션의 좌표값을 가지고 오는 것
    // 그러기 위해선 애니메이션의 크기를 알아야 한다. 따라서 스테이지의 넓이와 높이를 가져오는게 굉장히 중요
  }

  init() {
    // this.point = new Point(
    //   // centerX와 centerY가 정해진 다음 즉, resize 이벤트가 발생 후
    //   // init() 함수를 실행시켜서 Point를 생성
    //   this.centerX,
    //   this.centerY
    //   // 포인트가 화면 중간을 기준으로 그려질 수 있도록 정의
    // );
    this.points = []; // 정해진 포인트만큼 화면에 그리기

    for (let i = 0; i < this.totalPoints; i++) {
      const point = new Point(
          this.index + i, 
          this.pointGap * i, 
          this.centerY
          );
      this.points[i] = point;
    }
  }

  draw(ctx) {
    ctx.beginPath(); // 실제로 캔버스에 그리는 함수가 들어감
    ctx.fillStyle = this.color;

    let prevX = this.points[0].x;
    let prevY = this.points[0].y;
    // 처음과 마지막 포인트는 이동하지 않음

    // 가운데 포인트들만 위아래로 이동하며 웨이브를 생성
    ctx.moveTo(prevX, prevY);
    // 그러기 위해서 point의 index 값을 확인하고 index가 0이거나 total-1과 같으면(마지막 index이면)
    // update()함수를 실행시키지 않고, 그 외의 index일 경우만 update() 함수 실행
    for (let i = 0; i < this.totalPoints; i++) {
      if (i < this.totalPoints - 1) {
        this.points[i].update();
      }

      const cx = (prevX + this.points[i].x) / 2; // 중간값을 잡아줘서 부드러운 곡선이 되도록 함
      const cy = (prevY + this.points[i].y) / 2; // 중간값을 잡지 않으면 처음과 마지막 포인트가 잡혀 직선이 된다.
      // 일단 point를 연결할 때 선으로 연결해서 포인트가 어떻게 움직이는지 확인
      // ctx.lineTo(x, y); // lineTo를 사용하여 직선연결
      ctx.quadraticCurveTo(prevX, prevY, cx, cy); // 곡선연결

      prevX = this.points[i].x;
      prevY = this.points[i].y;
      // this.point.update(); // point update 실행

      // ctx.arc(this.point.x, this.point.y, 30, 0, 2 * Math.PI); //업데이트된 Point의 x,y 호출
      // ctx.fill(); // app.js에 wave 생성
    }

    ctx.lineTo(prevX, prevY);
    ctx.lineTo(this.stageWidth, this.stageHeight);
    ctx.lineTo(this.points[0].x, this.stageHeight);
    ctx.fill();
    ctx.closePath();
  }
}
