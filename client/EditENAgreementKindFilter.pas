
unit EditENAgreementKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENAgreementKindController ;

type
    TfrmENAgreementKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblUserGen : TLabel;
    edtUserGen: TEdit;

    HTTPRIOENAgreementKind: THTTPRIO;

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
  frmENAgreementKindFilterEdit: TfrmENAgreementKindFilterEdit;
  ENAgreementKindFilterObj: ENAgreementKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAgreementKindController  ;
}
{$R *.dfm}



procedure TfrmENAgreementKindFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtUserGen
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENAgreementKindObj.name; 



    edtUserGen.Text := ENAgreementKindObj.userGen; 


  end;

}

end;



procedure TfrmENAgreementKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAgreementKind: ENAgreementKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAgreementKindFilterObj.name := edtName.Text; 



     ENAgreementKindFilterObj.userGen := edtUserGen.Text; 




  end;
end;




end.