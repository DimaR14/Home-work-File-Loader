package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class FileService {

    @Autowired
    private FileRepository FileRepository;

    @Transactional
    public void addFile(File file) {
        FileRepository.save(file);
    }

    @Transactional
    public void deleteFile(File file) {
        FileRepository.delete(file);
    }

    @Transactional
    public List<File> findAll(Pageable pageable) {
        return FileRepository.findAll(pageable).getContent();
    }

    @Transactional
    public File findFile(int id) {
        return FileRepository.getOne(id);
    }

    @Transactional
    public long count() {
        return FileRepository.count();
    }

}
