
unit EditENStandardConstFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENStandardConstController ;

type
  TfrmENStandardConstFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENStandardConst: THTTPRIO;

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
  frmENStandardConstFilterEdit: TfrmENStandardConstFilterEdit;
  ENStandardConstFilterObj: ENStandardConstFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENStandardConstController  ;
}
{$R *.dfm}



procedure TfrmENStandardConstFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENStandardConstObj.name; 


  end;

}

end;



procedure TfrmENStandardConstFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENStandardConst: ENStandardConstControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENStandardConstFilterObj.name := edtName.Text; 




  end;
end;




end.