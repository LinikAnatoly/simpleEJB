
unit EditENBuilding2OSData;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons, ENBuilding2OSDataController ;

type
  TfrmENBuilding2OSDataEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
    lblNum_un : TLabel;
    edtNum_un: TEdit;
    lblNum_dovvod : TLabel;
    edtNum_dovvod: TEdit;
    lblDate_dovvod : TLabel;
    edtDate_dovvod: TDateTimePicker;
    lblKod_inv : TLabel;
    edtKod_inv: TEdit;
    lblKod_ist : TLabel;
    edtKod_ist: TEdit;
    lblName_ist : TLabel;
    edtName_ist: TEdit;
    lblSum_dovvod_n : TLabel;
    edtSum_dovvod_n: TEdit;
    lblSum_dovvod_b : TLabel;
    edtSum_dovvod_b: TEdit;
    lblSum_nds : TLabel;
    edtSum_nds: TEdit;
    lblSum_dovvod_nds_b : TLabel;
    edtSum_dovvod_nds_b: TEdit;
    lblSum_dovvod_izn_n : TLabel;
    edtSum_dovvod_izn_n: TEdit;
    lblSum_dovvod_izn_b : TLabel;
    edtSum_dovvod_izn_b: TEdit;
    lblName_dovvod : TLabel;
    edtName_dovvod: TMemo;
    lblUserGen : TLabel;
    edtUserGen: TEdit;
    lblDateEdit : TLabel;
    edtDateEdit: TDateTimePicker;
    lblKod_nakl : TLabel;
    edtKod_nakl: TEdit;
    lblDt_nakl : TLabel;
    edtDt_nakl: TDateTimePicker;
    lblKod_nal_nakl : TLabel;
    edtKod_nal_nakl: TEdit;
    lblKod_postav : TLabel;
    edtKod_postav: TEdit;
    lblKod_dogovor : TLabel;
    edtKod_dogovor: TEdit;
    lblDateBuh : TLabel;
    edtDateBuh: TDateTimePicker;


  HTTPRIOENBuilding2OSData: THTTPRIO;

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
  frmENBuilding2OSDataEdit: TfrmENBuilding2OSDataEdit;
  ENBuilding2OSDataObj: ENBuilding2OSData;

implementation



{$R *.dfm}



procedure TfrmENBuilding2OSDataEdit.FormShow(Sender: TObject);

begin

  if DialogState = dsView then
  begin
//     DisableControls([
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtNum_un
      ,edtNum_dovvod
      ,edtDate_dovvod
      ,edtKod_inv
      ,edtKod_ist
      ,edtSum_dovvod_b
      ,edtSum_nds
      ,edtSum_dovvod_nds_b
      ,edtName_dovvod
      ,edtKod_nakl
      ,edtDt_nakl
      ,edtKod_nal_nakl
      ,edtKod_postav
      ,edtKod_dogovor
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENBuilding2OSDataObj.code);
    if ( ENBuilding2OSDataObj.num_un <> Low(Integer) ) then
       edtNum_un.Text := IntToStr(ENBuilding2OSDataObj.num_un)
    else
       edtNum_un.Text := '';
    if ( ENBuilding2OSDataObj.num_dovvod <> Low(Integer) ) then
       edtNum_dovvod.Text := IntToStr(ENBuilding2OSDataObj.num_dovvod)
    else
       edtNum_dovvod.Text := '';
    SetDateFieldForDateTimePicker(edtDate_dovvod, ENBuilding2OSDataObj.date_dovvod);
    edtKod_inv.Text := ENBuilding2OSDataObj.kod_inv; 
    edtKod_ist.Text := ENBuilding2OSDataObj.kod_ist; 
    edtName_ist.Text := ENBuilding2OSDataObj.name_ist; 
    SetTXSDecimalForTEdit(edtSum_dovvod_n, ENBuilding2OSDataObj.sum_dovvod_n);
    SetTXSDecimalForTEdit(edtSum_dovvod_b, ENBuilding2OSDataObj.sum_dovvod_b);
    SetTXSDecimalForTEdit(edtSum_nds, ENBuilding2OSDataObj.sum_nds);
    SetTXSDecimalForTEdit(edtSum_dovvod_nds_b, ENBuilding2OSDataObj.sum_dovvod_nds_b);
    SetTXSDecimalForTEdit(edtSum_dovvod_izn_n, ENBuilding2OSDataObj.sum_dovvod_izn_n);
    SetTXSDecimalForTEdit(edtSum_dovvod_izn_b, ENBuilding2OSDataObj.sum_dovvod_izn_b);
    MakeMultiline(edtName_dovvod.Lines, ENBuilding2OSDataObj.name_dovvod);
    edtUserGen.Text := ENBuilding2OSDataObj.userGen; 
    SetDateFieldForDateTimePicker(edtDateEdit, ENBuilding2OSDataObj.dateEdit);
    edtKod_nakl.Text := ENBuilding2OSDataObj.kod_nakl; 
    SetDateFieldForDateTimePicker(edtDt_nakl, ENBuilding2OSDataObj.dt_nakl);
    edtKod_nal_nakl.Text := ENBuilding2OSDataObj.kod_nal_nakl; 
    edtKod_postav.Text := ENBuilding2OSDataObj.kod_postav; 
    edtKod_dogovor.Text := ENBuilding2OSDataObj.kod_dogovor; 
    SetDateFieldForDateTimePicker(edtDateBuh, ENBuilding2OSDataObj.dateBuh);


  end;
end;



procedure TfrmENBuilding2OSDataEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
      edtNum_un
      ,edtNum_dovvod
      ,edtKod_inv
      ,edtKod_ist
      ,edtSum_dovvod_b
      ,edtSum_nds
      ,edtSum_dovvod_nds_b
      ,edtName_dovvod
      ,edtKod_nakl
      ,edtKod_nal_nakl
      ,edtKod_postav
      ,edtKod_dogovor
     ])  then
  begin
      Application.MessageBox(PChar('Порожні поля неприпустимі!'),PChar('Увага!'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENBuilding2OSData := HTTPRIOENBuilding2OSData as ENBuilding2OSDataControllerSoapPort;

     if ( edtNum_un.Text <> '' ) then
       ENBuilding2OSDataObj.num_un := StrToInt(edtNum_un.Text)
     else
       ENBuilding2OSDataObj.num_un := Low(Integer) ;
     if ( edtNum_dovvod.Text <> '' ) then
       ENBuilding2OSDataObj.num_dovvod := StrToInt(edtNum_dovvod.Text)
     else
       ENBuilding2OSDataObj.num_dovvod := Low(Integer) ;
     ENBuilding2OSDataObj.date_dovvod := GetTXSDateFromTDateTimePicker(edtDate_dovvod);
     ENBuilding2OSDataObj.kod_inv := edtKod_inv.Text; 
     ENBuilding2OSDataObj.kod_ist := edtKod_ist.Text; 
     ENBuilding2OSDataObj.name_ist := edtName_ist.Text; 
     ENBuilding2OSDataObj.sum_dovvod_n := GetTXSDecimalFromTEdit(edtSum_dovvod_n);
     ENBuilding2OSDataObj.sum_dovvod_b := GetTXSDecimalFromTEdit(edtSum_dovvod_b);
     ENBuilding2OSDataObj.sum_nds := GetTXSDecimalFromTEdit(edtSum_nds);
     ENBuilding2OSDataObj.sum_dovvod_nds_b := GetTXSDecimalFromTEdit(edtSum_dovvod_nds_b);
     ENBuilding2OSDataObj.sum_dovvod_izn_n := GetTXSDecimalFromTEdit(edtSum_dovvod_izn_n);
     ENBuilding2OSDataObj.sum_dovvod_izn_b := GetTXSDecimalFromTEdit(edtSum_dovvod_izn_b);
     ENBuilding2OSDataObj.name_dovvod := edtName_dovvod.Text; 
     ENBuilding2OSDataObj.userGen := edtUserGen.Text; 
     ENBuilding2OSDataObj.dateEdit := GetTXSDateTimeFromTDateTimePicker(edtDateEdit);	   
     ENBuilding2OSDataObj.kod_nakl := edtKod_nakl.Text; 
     ENBuilding2OSDataObj.dt_nakl := GetTXSDateTimeFromTDateTimePicker(edtDt_nakl);	   
     ENBuilding2OSDataObj.kod_nal_nakl := edtKod_nal_nakl.Text; 
     ENBuilding2OSDataObj.kod_postav := edtKod_postav.Text; 
     ENBuilding2OSDataObj.kod_dogovor := edtKod_dogovor.Text; 
     ENBuilding2OSDataObj.dateBuh := GetTXSDateTimeFromTDateTimePicker(edtDateBuh);	   

    if DialogState = dsInsert then
    begin
      ENBuilding2OSDataObj.code:=low(Integer);
      TempENBuilding2OSData.add(ENBuilding2OSDataObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENBuilding2OSData.save(ENBuilding2OSDataObj);
    end;
  end;
end;


end.