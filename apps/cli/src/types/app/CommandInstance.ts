class CommandInstance {
  public name: string;
  public args: string[];

  constructor(name: string, args?: string[]) {
    this.name = name;
    this.args = args || [];
  }
}

export default CommandInstance;
