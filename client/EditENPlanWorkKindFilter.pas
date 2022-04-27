
unit EditENPlanWorkKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkKindController ;

type
  TfrmENPlanWorkKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkKind: THTTPRIO;

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
  frmENPlanWorkKindFilterEdit: TfrmENPlanWorkKindFilterEdit;
  ENPlanWorkKindFilterObj: ENPlanWorkKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkKindController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkKindFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkKindObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkKind: ENPlanWorkKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkKindFilterObj.name := edtName.Text; 




  end;
end;




end.