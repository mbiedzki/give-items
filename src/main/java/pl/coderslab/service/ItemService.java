package pl.coderslab.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pl.coderslab.model.Item;
import pl.coderslab.repository.ItemRepository;


import javax.transaction.Transactional;
import java.util.List;

@Service
@Transactional
public class ItemService {
    @Autowired
    private ItemRepository itemRepository;

    public void save(Item item) {itemRepository.save(item); }

    public void delete(Long id) {
        itemRepository.delete(id);
    }

    public Item findOne(Long id) {
        return itemRepository.findOne(id);
    }

    public List<Item> findAll() { return itemRepository.findAll(); }
}
