import alias from '../../config/alias';

class CommandInstance {
  public name: string;
  public args: string[];

  constructor(name: string, args?: string[]) {
    const nameSelected = alias[name as keyof typeof alias] || name;
    this.name = nameSelected;
    this.args = args || [];
  }
}

export default CommandInstance;
