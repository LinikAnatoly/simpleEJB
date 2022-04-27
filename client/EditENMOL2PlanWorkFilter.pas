
unit EditENMOL2PlanWorkFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMOL2PlanWorkController ;

type
  TfrmENMOL2PlanWorkFilterEdit = class(TDialogForm)

    lblMolName : TLabel;
    edtMolName: TEdit;
    lblMolCode : TLabel;
    edtMolCode: TEdit;


  HTTPRIOENMOL2PlanWork: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENMOL2PlanWorkFilterEdit: TfrmENMOL2PlanWorkFilterEdit;
  ENMOL2PlanWorkFilterObj: ENMOL2PlanWorkFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENMOL2PlanWorkController  ;
}
{$R *.dfm}



procedure TfrmENMOL2PlanWorkFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtMolName
      ,edtMolCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtMolName.Text := ENMOL2PlanWorkObj.molName; 



    edtMolCode.Text := ENMOL2PlanWorkObj.molCode; 


  end;

}

end;



procedure TfrmENMOL2PlanWorkFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENMOL2PlanWork: ENMOL2PlanWorkControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENMOL2PlanWorkFilterObj.molName := edtMolName.Text; 



     ENMOL2PlanWorkFilterObj.molCode := edtMolCode.Text; 




  end;
end;




end.