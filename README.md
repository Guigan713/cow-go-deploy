# cow-go-deploy


- name: récuperer le numero de verion
        id: version
          # VERSION_TAG="v${{ github.event.inputs.version }}"
          # echo "VERSION_TAG=$VERSION_TAG" >> $GITHUB_ENV
        run: |
          # Si l'entrée version est laissée à "auto", on incrémente la version
          if [ "${{ github.event.inputs.version }}" == "auto" ]; then
              # Vérifie si le fichier version.txt existe
              if [ -f version.txt ]; then
              # Lire la version actuelle et incrémenter
                  version=$(cat version.txt)
                  version_number=$(($version + 1))
              else
                  # Si le fichier n'existe pas, on commence à la version 1
                  version_number=1
              fi
              # Sauvegarder la nouvelle version dans version.txt
              echo "Nouvelle version: $version_number" > version.txt
              echo "version=$version_number" >> $GITHUB_ENV
          else
              # Si une version spécifique est fournie par l'utilisateur
              echo "version=${{ github.event.inputs.version }}" >> $GITHUB_ENV
          fi