class Fluid {
	IntList grid;
	int res;
	Fluid(int res) {
		this.res=constrain(res, 1, 512);
		this.grid=new IntList();
		for (int i=0; i<this.res*this.res; i++) {
			this.grid.append(0);
		}
	}
	int _idx(PVector p) {
		return int(p.x)+int(p.y)*this.res;
	}
	PVector _pos(int i) {
		return new PVector(i%this.res, int((float)i/this.res));
	}
	int _get(PVector p) {
		if (p.x<0||p.x>this.res-1||p.y<0||p.y>this.res-1) {
			return 0;
		};
		return this.grid.get(this._idx(p));
	}
	void addDrop(int x, int y, int val) {
		this.grid.set(this._idx(new PVector(x, y)), val);
	}
	void update() {
		IntList g = new IntList(this.res*this.res);
		for (int i=0; i<this.res*this.res; i++) {
			PVector pos=this._pos(i);
			g.set(i, (this._get(pos)+this._get(pos.copy().add(1, 0))+this._get(pos.copy().sub(1, 0))+this._get(pos.copy().sub(0, 1))+this._get(pos.copy().add(0, 1)))/5);
		}
		this.grid=g;
	}
	void render() {
		rectMode(CORNER);
		noStroke();
		fill(#16B3F0);
		for (int i=0; i<this.res*this.res; i++) {
			fill(map(this.grid.get(i), 0, 100, 0, 255));
			PVector pos=this._pos(i);
			pos.mult((512/this.res));
			rect(pos.x, pos.y, 512/this.res, 512/this.res);
		}
	}
}
