
unit EditENBranch2Customer04Filter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranch2Customer04Controller ;

type
  TfrmENBranch2Customer04FilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCurrentAutomat : TLabel;
    edtCurrentAutomat: TEdit;



  HTTPRIOENBranch2Customer04: THTTPRIO;

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
  frmENBranch2Customer04FilterEdit: TfrmENBranch2Customer04FilterEdit;
  ENBranch2Customer04FilterObj: ENBranch2Customer04Filter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBranch2Customer04Controller  ;
}
{$R *.dfm}



procedure TfrmENBranch2Customer04FilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBranch2Customer04Obj.name; 



    if ( ENBranch2Customer04Obj.currentAutomat <> nil ) then
       edtCurrentAutomat.Text := ENBranch2Customer04Obj.currentAutomat.decimalString
    else
       edtCurrentAutomat.Text := ''; 


  end;

}

end;



procedure TfrmENBranch2Customer04FilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranch2Customer04: ENBranch2Customer04ControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBranch2Customer04FilterObj.name := edtName.Text; 



     if (ENBranch2Customer04FilterObj.currentAutomat = nil ) then
       ENBranch2Customer04FilterObj.currentAutomat := TXSDecimal.Create;
     if edtCurrentAutomat.Text <> '' then
       ENBranch2Customer04FilterObj.currentAutomat.decimalString := edtCurrentAutomat.Text 
     else
       ENBranch2Customer04FilterObj.currentAutomat := nil;





  end;
end;




end.