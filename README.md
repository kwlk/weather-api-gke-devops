# Weather API - GKE + CI/CD Pipeline

## Opis projektu

Weather API to prosta aplikacja REST w Javie (Spring Boot), która udostępnia dane pogodowe.  
Projekt demonstruje pełny pipeline DevOps na Google Cloud Platform (GCP) z wykorzystaniem:

- Google Kubernetes Engine (GKE) do uruchomienia aplikacji w kontenerach
- Cloud Build do automatycznego budowania obrazów Docker i deploymentu
- Artifact Registry jako repozytorium obrazów Docker
- GitOps: automatyczne wdrożenia po pushu do repozytorium
- Cloud Monitoring (Logging i Metrics) do monitorowania aplikacji
- IAM do kontroli dostępu

---

## Jak uruchomić lokalnie

1. Sklonuj repozytorium:

```bash
git clone https://github.com/joannawalach1/weather-api-gke-devops.git

