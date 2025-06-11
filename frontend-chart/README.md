# Frontend Helm Chart

이 Helm 차트는 journal-server frontend 애플리케이션을 배포하기 위한 차트입니다.

## 설치

```bash
helm install my-frontend ./frontend-chart
```

## 업그레이드

```bash
helm upgrade my-frontend ./frontend-chart
```

## 제거

```bash
helm uninstall my-frontend
```

## Configuration

다음 표는 차트의 구성 가능한 매개변수와 기본값을 보여줍니다.

| Parameter | Description | Default |
|-----------|-------------|---------|
| `replicaCount` | 배포할 Pod 수 | `2` |
| `image.repository` | 이미지 저장소 | `brendanburns/journal-server` |
| `image.tag` | 이미지 태그 | `latest` |
| `image.pullPolicy` | 이미지 pull 정책 | `Always` |
| `resources.requests.cpu` | CPU 요청량 | `1.0` |
| `resources.requests.memory` | 메모리 요청량 | `1G` |
| `resources.limits.cpu` | CPU 제한량 | `1.0` |
| `resources.limits.memory` | 메모리 제한량 | `1G` |
| `config.journalEntries` | Journal entries 설정 | `default-entries` |
| `secret.name` | Redis password secret 이름 | `redis-passwd` |
| `service.type` | Service 타입 | `ClusterIP` |
| `service.port` | Service 포트 | `80` |

## 사용 예시

### 레플리카 수 변경
```bash
helm install my-frontend ./frontend-chart --set replicaCount=3
```

### 커스텀 values 파일 사용
```bash
helm install my-frontend ./frontend-chart -f my-values.yaml
```

### 값 확인
```bash
helm get values my-frontend
``` 