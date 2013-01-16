## Tools used
SHUFFLE         := shuffle
RULER           := ruler
AGC             := uuagc
GHC             := ghc
GHC_OPTS        := -XTypeSynonymInstances -XFlexibleInstances -XFlexibleContexts

## General settings
BUILD_PREFIX    := build/
RULER_DEMO_EXEC := rulerdemo

## Shuffle settings
SHUFFLE_ORDER   := 1 < 2 < 3
SHUFFLE_FINAL   := 3
SHUFFLE_OPTS    := --markchanges="E - AG"

## File names
AG_MAIN         := RulerDemoMain
SRC_CAG_MAIN    := $(AG_MAIN).cag
DRV_AG_MAIN     := $(BUILD_PREFIX)$(AG_MAIN).ag
DRV_HS_MAIN     := $(BUILD_PREFIX)$(AG_MAIN).hs
RUL_BASE        := rulerDemoRL
SRC_CRL         := $(RUL_BASE).crl2
DRV_RL2         := $(BUILD_PREFIX)$(RUL_BASE).rl2
AG_BASE         := rulerDemoAG
DRV_CAG         := $(BUILD_PREFIX)demo.cag
DRV_AG          := $(BUILD_PREFIX)demo.ag
UTILS           := RulerDemoUtils
SRC_CHS_UTILS   := $(UTILS).chs
DRV_HS_UTILS    := $(BUILD_PREFIX)$(UTILS).hs

## Actual rules
all: $(RULER_DEMO_EXEC)

$(DRV_AG_MAIN): $(SRC_CAG_MAIN)
	@mkdir -p $(@D)
	$(SHUFFLE) --gen-reqm=$(SHUFFLE_FINAL) --ag --variant-order="$(SHUFFLE_ORDER)" --base=Main --preamble=no --lhs2tex=no $< > $@

$(DRV_RL2): $(SRC_CRL)
	@mkdir -p $(@D)
	$(SHUFFLE) --gen-reqm=$(SHUFFLE_FINAL) --plain --variant-order="$(SHUFFLE_ORDER)" --lhs2tex=no $< > $@

$(DRV_CAG): $(DRV_RL2)
	@mkdir -p $(@D)
	$(RULER) $(RULER2_OPTS) --ag --ATTR --DATA --selrule="(3).(*).(*)" --wrapshuffle  --base=$(AG_BASE) $< > $@

$(DRV_AG): $(DRV_CAG)
	@mkdir -p $(@D)
	$(SHUFFLE) --gen-reqm=$(SHUFFLE_FINAL) --plain --variant-order="$(SHUFFLE_ORDER)"  --lhs2tex=no $< > $@

$(DRV_HS_MAIN): $(DRV_AG_MAIN) $(DRV_AG)
	@mkdir -p $(@D)
	$(AGC) -csdfr -P$(BUILD_PREFIX) $<

$(DRV_HS_UTILS): $(SRC_CHS_UTILS)
	@mkdir -p $(@D)
	$(SHUFFLE) --gen-reqm=$(SHUFFLE_FINAL) --hs --variant-order="$(SHUFFLE_ORDER)" --preamble=no --lhs2tex=no $< > $@

$(RULER_DEMO_EXEC): $(DRV_HS_MAIN) $(DRV_HS_UTILS)
	@mkdir -p $(@D)
	$(GHC) --make $(GHC_OPTS) -i$(BUILD_PREFIX) $(DRV_HS_MAIN) -o $@

# Cleaning up
clean:
	@rm -rf $(BUILD_PREFIX)
