.PHONY: bump

CHART_FILE = charts/picoclaw/Chart.yaml
CHART_PATTERN = version:\s*(\d+\.\d+\.\d+)

bump:
	@VERSION=$$(go run github.com/mattn/bump@latest up -y -w -f $(CHART_FILE) -p '$(CHART_PATTERN)') && \
		[ -n "$$VERSION" ] && \
		git commit --no-gpg-sign -am "bump version to $$VERSION" && \
		git tag "v$$VERSION" && \
		git push origin main && \
		git push origin "v$$VERSION"
