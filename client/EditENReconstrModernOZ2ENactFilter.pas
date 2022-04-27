
unit EditENReconstrModernOZ2ENactFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENReconstrModernOZ2ENactController ;

type
  TfrmENReconstrModernOZ2ENactFilterEdit = class(TDialogForm)



  HTTPRIOENReconstrModernOZ2ENact: THTTPRIO;

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
  frmENReconstrModernOZ2ENactFilterEdit: TfrmENReconstrModernOZ2ENactFilterEdit;
  ENReconstrModernOZ2ENactFilterObj: ENReconstrModernOZ2ENactFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENReconstrModernOZ2ENactController  ;
}
{$R *.dfm}



procedure TfrmENReconstrModernOZ2ENactFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
  end;

}

end;



procedure TfrmENReconstrModernOZ2ENactFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENReconstrModernOZ2ENact: ENReconstrModernOZ2ENactControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin


  end;
end;




end.