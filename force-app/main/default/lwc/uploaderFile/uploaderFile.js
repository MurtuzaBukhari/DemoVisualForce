import { LightningElement, track, api } from 'lwc';

export default class uploaderFile extends LightningElement {
    @track files = [];
    @track currentPage = 1;
    @track pageSize = 1; // Number of previews per page

    get totalPages() {
        return Math.ceil(this.files.length / this.pageSize);
    }

    get pagedFiles() {
        const start = (this.currentPage - 1) * this.pageSize;
        const end = start + this.pageSize;
        return this.files.slice(start, end);
    }

    async handleFileChange(event) {
        const fileInputs = event.target.files;

        if (fileInputs.length > 0) {
            for (let i = 0; i < fileInputs.length; i++) {
                const file = fileInputs[i];
                this.files.push({
                    Id: i,
                    Title: file.name,
                    fileUrl: URL.createObjectURL(file),
                    showPreview: false,
                });
            }
        }
    }

    // show(event) {
    //     console.log("Data : ",files.Title);
    //     // const fileId = event.target.dataset.fileId;
    //     // const file = this.files.find((f) => f.Id === fileId);

    //     // if (file) {
    //     //     const fileUrl = window.URL.createObjectURL(file.FileObject);
    //     //     console.log('File Name:', file.Title);
    //     //     console.log('File URL:', fileUrl);

    //     //     // Release the object URL to free up resources
    //     //     window.URL.revokeObjectURL(fileUrl);
    //     // }
    // }

    previousPage() {
        if (this.currentPage > 1) {
            this.currentPage -= 1;
        }
    }

    nextPage() {
        if (this.currentPage < this.totalPages) {
            this.currentPage += 1;
        }
    }

}
