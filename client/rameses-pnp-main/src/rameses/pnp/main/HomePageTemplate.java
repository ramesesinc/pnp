/*
 * HomePageTemplate.java
 *
 * Created on August 17, 2013, 10:20 AM
 */

package rameses.pnp.main;

/**
 *
 * @author  wflores
 */
public class HomePageTemplate extends javax.swing.JPanel {
    
    public HomePageTemplate() {
        initComponents();
    }
    
    /** This method is called from within the constructor to
     * initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is
     * always regenerated by the Form Editor.
     */
    // <editor-fold defaultstate="collapsed" desc=" Generated Code ">//GEN-BEGIN:initComponents
    private void initComponents() {
        xImage1 = new com.rameses.rcp.control.XImage();

        setLayout(new java.awt.BorderLayout());

        xImage1.setBackground(new java.awt.Color(255, 255, 255));
        com.rameses.rcp.control.border.XEtchedBorder xEtchedBorder1 = new com.rameses.rcp.control.border.XEtchedBorder();
        xEtchedBorder1.setHideLeft(true);
        xEtchedBorder1.setHideRight(true);
        xEtchedBorder1.setHideTop(true);
        xEtchedBorder1.setPadding(new java.awt.Insets(0, 10, 0, 0));
        xImage1.setBorder(xEtchedBorder1);
        xImage1.setText("xImage1");
        xImage1.setIconResource("images/main-logo.png");
        xImage1.setOpaque(true);
        xImage1.setPreferredSize(new java.awt.Dimension(46, 85));
        add(xImage1, java.awt.BorderLayout.NORTH);

    }// </editor-fold>//GEN-END:initComponents
    
    
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private com.rameses.rcp.control.XImage xImage1;
    // End of variables declaration//GEN-END:variables
    
}
