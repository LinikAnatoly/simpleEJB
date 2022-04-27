
unit EditRQOrgBankFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQOrgBankController ;

type
  TfrmRQOrgBankFilterEdit = class(TDialogForm)

    lblId : TLabel;
    edtId: TEdit;

    lblMfo : TLabel;
    edtMfo: TEdit;

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQOrgBank: THTTPRIO;

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
  frmRQOrgBankFilterEdit: TfrmRQOrgBankFilterEdit;
  RQOrgBankFilterObj: RQOrgBankFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQOrgBankController  ;
}
{$R *.dfm}



procedure TfrmRQOrgBankFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtId
      ,edtMfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( RQOrgBankObj.id <> Low(Integer) ) then
       edtId.Text := IntToStr(RQOrgBankObj.id)
    else
       edtId.Text := '';



    edtMfo.Text := RQOrgBankObj.mfo; 



    edtName.Text := RQOrgBankObj.name; 


  end;

}

end;



procedure TfrmRQOrgBankFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQOrgBank: RQOrgBankControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtId.Text <> '' ) then
       RQOrgBankFilterObj.id := StrToInt(edtId.Text)
     else
       RQOrgBankFilterObj.id := Low(Integer) ;




     RQOrgBankFilterObj.mfo := edtMfo.Text; 



     RQOrgBankFilterObj.name := edtName.Text; 




  end;
end;




end.