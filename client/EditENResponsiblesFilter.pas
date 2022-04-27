
unit EditENResponsiblesFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENResponsiblesController ;

type
  TfrmENResponsiblesFilterEdit = class(TDialogForm)

    lblFIO : TLabel;
    edtFIO: TEdit;

    lblTabNumber : TLabel;
    edtTabNumber: TEdit;

    lblPosition : TLabel;
    edtPosition: TEdit;

    lblDepName : TLabel;
    edtDepName: TEdit;

    lblDepCode : TLabel;
    edtDepCode: TEdit;

    lblPhone : TLabel;
    edtPhone: TEdit;



  HTTPRIOENResponsibles: THTTPRIO;

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
  frmENResponsiblesFilterEdit: TfrmENResponsiblesFilterEdit;
  ENResponsiblesFilterObj: ENResponsiblesFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENResponsiblesController  ;
}
{$R *.dfm}



procedure TfrmENResponsiblesFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtFIO.Text := ENResponsiblesObj.FIO; 



    if ( ENResponsiblesObj.tabNumber <> Low(Integer) ) then
       edtTabNumber.Text := IntToStr(ENResponsiblesObj.tabNumber)
    else
       edtTabNumber.Text := '';



    edtPosition.Text := ENResponsiblesObj.position; 



    edtDepName.Text := ENResponsiblesObj.depName; 



    edtDepCode.Text := ENResponsiblesObj.depCode; 



    edtPhone.Text := ENResponsiblesObj.phone; 


  end;

}

end;



procedure TfrmENResponsiblesFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENResponsibles: ENResponsiblesControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENResponsiblesFilterObj.FIO := edtFIO.Text; 

     if ( edtTabNumber.Text <> '' ) then
       ENResponsiblesFilterObj.tabNumber := edtTabNumber.Text
     else
       ENResponsiblesFilterObj.tabNumber := '';

     ENResponsiblesFilterObj.position := edtPosition.Text;
     ENResponsiblesFilterObj.depName := edtDepName.Text;
     ENResponsiblesFilterObj.depCode := edtDepCode.Text;
     ENResponsiblesFilterObj.phone := edtPhone.Text;

  end;
end;




end.