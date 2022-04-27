
unit EditCNPack;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, CNPackController ;

type
  TfrmCNPackEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblPackCode : TLabel;
    edtPackCode: TEdit;
    lblName : TLabel;
    edtName: TMemo;
    lblId_ren : TLabel;
    edtId_ren: TEdit;
    lblRenName : TLabel;
    edtRenName: TEdit;
    lblId_pack_status : TLabel;
    edtId_pack_status: TEdit;
    lblStatusName : TLabel;
    edtStatusName: TEdit;
    lblDescription : TLabel;
    edtDescription: TMemo;
    lblPower : TLabel;
    edtPower: TEdit;
    lblAddress : TLabel;
    edtAddress: TMemo;
    lblReg_num_cn_contract : TLabel;
    edtReg_num_cn_contract: TEdit;
    lblDate_cn_contract : TLabel;
    edtDate_cn_contract: TDateTimePicker;
    lblReg_num_tu_contract : TLabel;
    edtReg_num_tu_contract: TEdit;
    lblDate_tu_contract : TLabel;
    edtDate_tu_contract: TDateTimePicker;
    lblReg_num_tu_cr_contract : TLabel;
    edtReg_num_tu_cr_contract: TEdit;
    lblDate_tu_cr_contract : TLabel;
    edtDate_tu_cr_contract: TDateTimePicker;
    lblProject_num : TLabel;
    edtProject_num: TEdit;
    lblProject_date : TLabel;
    edtProject_date: TDateTimePicker;


  HTTPRIOCNPack: THTTPRIO;

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
  frmCNPackEdit: TfrmCNPackEdit;
  CNPackObj: CNPack;

implementation


{uses  
    EnergyproController, EnergyproController2, CNPackController  ;
}
{$R *.dfm}



procedure TfrmCNPackEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtPackCode
      ,edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(CNPackObj.code);
    if ( CNPackObj.packCode <> Low(Integer) ) then
       edtPackCode.Text := IntToStr(CNPackObj.packCode)
    else
       edtPackCode.Text := '';
    MakeMultiline(edtName.Lines, CNPackObj.name);
    if ( CNPackObj.id_ren <> Low(Integer) ) then
       edtId_ren.Text := IntToStr(CNPackObj.id_ren)
    else
       edtId_ren.Text := '';
    edtRenName.Text := CNPackObj.renName; 
    if ( CNPackObj.id_pack_status <> Low(Integer) ) then
       edtId_pack_status.Text := IntToStr(CNPackObj.id_pack_status)
    else
       edtId_pack_status.Text := '';
    edtStatusName.Text := CNPackObj.statusName; 
    MakeMultiline(edtDescription.Lines, CNPackObj.description);
    if ( CNPackObj.power <> nil ) then
       edtPower.Text := CNPackObj.power.decimalString
    else
       edtPower.Text := ''; 
    MakeMultiline(edtAddress.Lines, CNPackObj.address);
    edtReg_num_cn_contract.Text := CNPackObj.reg_num_cn_contract; 
      if CNPackObj.date_cn_contract <> nil then
      begin
        edtDate_cn_contract.DateTime:=EncodeDate(CNPackObj.date_cn_contract.Year,CNPackObj.date_cn_contract.Month,CNPackObj.date_cn_contract.Day);
        edtDate_cn_contract.checked := true;
      end
      else
      begin
        edtDate_cn_contract.DateTime:=SysUtils.Date;
        edtDate_cn_contract.checked := false;
      end;
    edtReg_num_tu_contract.Text := CNPackObj.reg_num_tu_contract; 
      if CNPackObj.date_tu_contract <> nil then
      begin
        edtDate_tu_contract.DateTime:=EncodeDate(CNPackObj.date_tu_contract.Year,CNPackObj.date_tu_contract.Month,CNPackObj.date_tu_contract.Day);
        edtDate_tu_contract.checked := true;
      end
      else
      begin
        edtDate_tu_contract.DateTime:=SysUtils.Date;
        edtDate_tu_contract.checked := false;
      end;
    edtReg_num_tu_cr_contract.Text := CNPackObj.reg_num_tu_cr_contract; 
      if CNPackObj.date_tu_cr_contract <> nil then
      begin
        edtDate_tu_cr_contract.DateTime:=EncodeDate(CNPackObj.date_tu_cr_contract.Year,CNPackObj.date_tu_cr_contract.Month,CNPackObj.date_tu_cr_contract.Day);
        edtDate_tu_cr_contract.checked := true;
      end
      else
      begin
        edtDate_tu_cr_contract.DateTime:=SysUtils.Date;
        edtDate_tu_cr_contract.checked := false;
      end;
    edtProject_num.Text := CNPackObj.project_num; 
      if CNPackObj.project_date <> nil then
      begin
        edtProject_date.DateTime:=EncodeDate(CNPackObj.project_date.Year,CNPackObj.project_date.Month,CNPackObj.project_date.Day);
        edtProject_date.checked := true;
      end
      else
      begin
        edtProject_date.DateTime:=SysUtils.Date;
        edtProject_date.checked := false;
      end;


  end;
end;



procedure TfrmCNPackEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempCNPack: CNPackControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtPackCode
      ,edtName
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempCNPack := HTTPRIOCNPack as CNPackControllerSoapPort;


     if ( edtPackCode.Text <> '' ) then
       CNPackObj.packCode := StrToInt(edtPackCode.Text)
     else
       CNPackObj.packCode := Low(Integer) ;

     CNPackObj.name := edtName.Text; 

     if ( edtId_ren.Text <> '' ) then
       CNPackObj.id_ren := StrToInt(edtId_ren.Text)
     else
       CNPackObj.id_ren := Low(Integer) ;

     CNPackObj.renName := edtRenName.Text; 

     if ( edtId_pack_status.Text <> '' ) then
       CNPackObj.id_pack_status := StrToInt(edtId_pack_status.Text)
     else
       CNPackObj.id_pack_status := Low(Integer) ;

     CNPackObj.statusName := edtStatusName.Text; 

     CNPackObj.description := edtDescription.Text; 

     if (CNPackObj.power = nil ) then
       CNPackObj.power := TXSDecimal.Create;
     if edtPower.Text <> '' then
       CNPackObj.power.decimalString := edtPower.Text 
     else
       CNPackObj.power := nil;

     CNPackObj.address := edtAddress.Text; 

     CNPackObj.reg_num_cn_contract := edtReg_num_cn_contract.Text; 

     if edtdate_cn_contract.checked then
     begin 
       if CNPackObj.date_cn_contract = nil then
          CNPackObj.date_cn_contract := TXSDate.Create;
       CNPackObj.date_cn_contract.XSToNative(GetXSDate(edtdate_cn_contract.DateTime));
     end
     else
       CNPackObj.date_cn_contract := nil;

     CNPackObj.reg_num_tu_contract := edtReg_num_tu_contract.Text; 

     if edtdate_tu_contract.checked then
     begin 
       if CNPackObj.date_tu_contract = nil then
          CNPackObj.date_tu_contract := TXSDate.Create;
       CNPackObj.date_tu_contract.XSToNative(GetXSDate(edtdate_tu_contract.DateTime));
     end
     else
       CNPackObj.date_tu_contract := nil;

     CNPackObj.reg_num_tu_cr_contract := edtReg_num_tu_cr_contract.Text; 

     if edtdate_tu_cr_contract.checked then
     begin 
       if CNPackObj.date_tu_cr_contract = nil then
          CNPackObj.date_tu_cr_contract := TXSDate.Create;
       CNPackObj.date_tu_cr_contract.XSToNative(GetXSDate(edtdate_tu_cr_contract.DateTime));
     end
     else
       CNPackObj.date_tu_cr_contract := nil;

     CNPackObj.project_num := edtProject_num.Text; 

     if edtproject_date.checked then
     begin 
       if CNPackObj.project_date = nil then
          CNPackObj.project_date := TXSDate.Create;
       CNPackObj.project_date.XSToNative(GetXSDate(edtproject_date.DateTime));
     end
     else
       CNPackObj.project_date := nil;

    if DialogState = dsInsert then
    begin
      CNPackObj.code:=low(Integer);
      TempCNPack.add(CNPackObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempCNPack.save(CNPackObj);
    end;
  end;
end;


end.