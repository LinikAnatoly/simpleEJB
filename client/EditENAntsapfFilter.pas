
unit EditENAntsapfFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAntsapfController ;

type
  TfrmENAntsapfFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENAntsapf: THTTPRIO;

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
  frmENAntsapfFilterEdit: TfrmENAntsapfFilterEdit;
  ENAntsapfFilterObj: ENAntsapfFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAntsapfController  ;
}
{$R *.dfm}



procedure TfrmENAntsapfFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENAntsapfObj.name; 


  end;

}

end;



procedure TfrmENAntsapfFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAntsapf: ENAntsapfControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAntsapfFilterObj.name := edtName.Text; 




  end;
end;




end.