
unit EditENSchemeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSchemeController ;

type
  TfrmENSchemeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENScheme: THTTPRIO;

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
  frmENSchemeFilterEdit: TfrmENSchemeFilterEdit;
  ENSchemeFilterObj: ENSchemeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSchemeController  ;
}
{$R *.dfm}



procedure TfrmENSchemeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENSchemeObj.name; 


  end;

}

end;



procedure TfrmENSchemeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENScheme: ENSchemeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSchemeFilterObj.name := edtName.Text; 




  end;
end;




end.