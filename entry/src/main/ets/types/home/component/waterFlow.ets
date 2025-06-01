export class WaterFlowDataSource implements IDataSource {
  private dataArray: Resource[] = []
  private listeners: DataChangeListener[] = []

  constructor() {
    for (let i = 0; i < 20; i++) {
      this.dataArray.push($r("app.media.waterflow_1"))
      this.dataArray.push($r("app.media.waterflow_2"))
      this.dataArray.push($r("app.media.waterflow_3"))
    }
  }

  public getData(index: number): Resource {
    return this.dataArray[index]
  }

  totalCount(): number {
    return this.dataArray.length
  }

  registerDataChangeListener(listener: DataChangeListener): void {
    if (this.listeners.indexOf(listener) < 0) {
      this.listeners.push(listener)
    }
  }

  unregisterDataChangeListener(listener: DataChangeListener): void {
    const pos = this.listeners.indexOf(listener)
    if (pos >= 0) {
      this.listeners.splice(pos, 1)
    }
  }
}