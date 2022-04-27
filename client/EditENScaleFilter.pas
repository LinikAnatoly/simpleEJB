
unit EditENScaleFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENScaleController ;

type
  TfrmENScaleFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENScale: THTTPRIO;

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
  frmENScaleFilterEdit: TfrmENScaleFilterEdit;
  ENScaleFilterObj: ENScaleFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENScaleController  ;
}
{$R *.dfm}



procedure TfrmENScaleFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENScaleObj.name; 


  end;

}

end;



procedure TfrmENScaleFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENScale: ENScaleControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENScaleFilterObj.name := edtName.Text; 




  end;
end;




end.