import { Router } from 'express';
import { getMenu, validateOrder } from '../controllers/menuController';

const router = Router();

router.get('/', getMenu);
router.post('/validate', validateOrder);

export default router;
