TARGETS = magnet_spintop.stl base_top.stl base_bottom.stl
DEPENDS = $(TARGETS:.stl=.dep)

all: $(TARGETS)

clean:
	rm -f $(TARGETS) $(DEPENDS)

%.stl: %.scad
	openscad $< -o $@ -d $(@:.stl=.dep) -D'mode="parts"'

-include $(DEPENDS)
