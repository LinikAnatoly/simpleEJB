
unit EditENObjCrossUpFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENObjCrossUpController ;

type
  TfrmENObjCrossUpFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENObjCrossUp: THTTPRIO;

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
  frmENObjCrossUpFilterEdit: TfrmENObjCrossUpFilterEdit;
  ENObjCrossUpFilterObj: ENObjCrossUpFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENObjCrossUpController  ;
}
{$R *.dfm}



procedure TfrmENObjCrossUpFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENObjCrossUpObj.name; 


  end;

}

end;



procedure TfrmENObjCrossUpFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENObjCrossUp: ENObjCrossUpControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENObjCrossUpFilterObj.name := edtName.Text; 




  end;
end;




end.