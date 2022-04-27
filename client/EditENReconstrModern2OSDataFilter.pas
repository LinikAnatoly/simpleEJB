
unit EditENReconstrModern2OSDataFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENReconstrModern2OSDataController ;

type
  TfrmENReconstrModern2OSDataFilterEdit = class(TDialogForm)

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


  HTTPRIOENReconstrModern2OSData: THTTPRIO;

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
  frmENReconstrModern2OSDataFilterEdit: TfrmENReconstrModern2OSDataFilterEdit;
  ENReconstrModern2OSDataFilterObj: ENReconstrModern2OSDataFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENReconstrModern2OSDataController  ;
}
{$R *.dfm}



procedure TfrmENReconstrModern2OSDataFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

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

    if ( ENReconstrModern2OSDataObj.num_un <> Low(Integer) ) then
       edtNum_un.Text := IntToStr(ENReconstrModern2OSDataObj.num_un)
    else
       edtNum_un.Text := '';



    if ( ENReconstrModern2OSDataObj.num_dovvod <> Low(Integer) ) then
       edtNum_dovvod.Text := IntToStr(ENReconstrModern2OSDataObj.num_dovvod)
    else
       edtNum_dovvod.Text := '';



      if ENReconstrModern2OSDataObj.date_dovvod <> nil then
      begin
        edtDate_dovvod.DateTime:=EncodeDate(ENReconstrModern2OSDataObj.date_dovvod.Year,ENReconstrModern2OSDataObj.date_dovvod.Month,ENReconstrModern2OSDataObj.date_dovvod.Day);
        edtDate_dovvod.checked := true;
      end
      else
      begin
        edtDate_dovvod.DateTime:=SysUtils.Date;
        edtDate_dovvod.checked := false;
      end;



    edtKod_inv.Text := ENReconstrModern2OSDataObj.kod_inv; 



    edtKod_ist.Text := ENReconstrModern2OSDataObj.kod_ist; 



    edtName_ist.Text := ENReconstrModern2OSDataObj.name_ist; 



    if ( ENReconstrModern2OSDataObj.sum_dovvod_n <> nil ) then
       edtSum_dovvod_n.Text := ENReconstrModern2OSDataObj.sum_dovvod_n.decimalString
    else
       edtSum_dovvod_n.Text := ''; 



    if ( ENReconstrModern2OSDataObj.sum_dovvod_b <> nil ) then
       edtSum_dovvod_b.Text := ENReconstrModern2OSDataObj.sum_dovvod_b.decimalString
    else
       edtSum_dovvod_b.Text := ''; 



    if ( ENReconstrModern2OSDataObj.sum_nds <> nil ) then
       edtSum_nds.Text := ENReconstrModern2OSDataObj.sum_nds.decimalString
    else
       edtSum_nds.Text := ''; 



    if ( ENReconstrModern2OSDataObj.sum_dovvod_nds_b <> nil ) then
       edtSum_dovvod_nds_b.Text := ENReconstrModern2OSDataObj.sum_dovvod_nds_b.decimalString
    else
       edtSum_dovvod_nds_b.Text := ''; 



    if ( ENReconstrModern2OSDataObj.sum_dovvod_izn_n <> nil ) then
       edtSum_dovvod_izn_n.Text := ENReconstrModern2OSDataObj.sum_dovvod_izn_n.decimalString
    else
       edtSum_dovvod_izn_n.Text := ''; 



    if ( ENReconstrModern2OSDataObj.sum_dovvod_izn_b <> nil ) then
       edtSum_dovvod_izn_b.Text := ENReconstrModern2OSDataObj.sum_dovvod_izn_b.decimalString
    else
       edtSum_dovvod_izn_b.Text := ''; 



    MakeMultiline(edtName_dovvod.Lines, ENReconstrModern2OSDataObj.name_dovvod);



    edtUserGen.Text := ENReconstrModern2OSDataObj.userGen; 



      if ENReconstrModern2OSDataObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENReconstrModern2OSDataObj.dateEdit.Year,ENReconstrModern2OSDataObj.dateEdit.Month,ENReconstrModern2OSDataObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtKod_nakl.Text := ENReconstrModern2OSDataObj.kod_nakl; 



      if ENReconstrModern2OSDataObj.dt_nakl <> nil then
      begin
        edtDt_nakl.DateTime:=EncodeDate(ENReconstrModern2OSDataObj.dt_nakl.Year,ENReconstrModern2OSDataObj.dt_nakl.Month,ENReconstrModern2OSDataObj.dt_nakl.Day);
        edtDt_nakl.checked := true;
      end
      else
      begin
        edtDt_nakl.DateTime:=SysUtils.Date;
        edtDt_nakl.checked := false;
      end;	  



    edtKod_nal_nakl.Text := ENReconstrModern2OSDataObj.kod_nal_nakl; 



    edtKod_postav.Text := ENReconstrModern2OSDataObj.kod_postav; 



    edtKod_dogovor.Text := ENReconstrModern2OSDataObj.kod_dogovor; 



      if ENReconstrModern2OSDataObj.dateBuh <> nil then
      begin
        edtDateBuh.DateTime:=EncodeDate(ENReconstrModern2OSDataObj.dateBuh.Year,ENReconstrModern2OSDataObj.dateBuh.Month,ENReconstrModern2OSDataObj.dateBuh.Day);
        edtDateBuh.checked := true;
      end
      else
      begin
        edtDateBuh.DateTime:=SysUtils.Date;
        edtDateBuh.checked := false;
      end;	  


  end;

}

end;



procedure TfrmENReconstrModern2OSDataFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENReconstrModern2OSData: ENReconstrModern2OSDataControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtNum_un.Text <> '' ) then
       ENReconstrModern2OSDataFilterObj.num_un := StrToInt(edtNum_un.Text)
     else
       ENReconstrModern2OSDataFilterObj.num_un := Low(Integer) ;




     if ( edtNum_dovvod.Text <> '' ) then
       ENReconstrModern2OSDataFilterObj.num_dovvod := StrToInt(edtNum_dovvod.Text)
     else
       ENReconstrModern2OSDataFilterObj.num_dovvod := Low(Integer) ;




     if edtdate_dovvod.checked then
     begin 
       if ENReconstrModern2OSDataFilterObj.date_dovvod = nil then
          ENReconstrModern2OSDataFilterObj.date_dovvod := TXSDate.Create;
       ENReconstrModern2OSDataFilterObj.date_dovvod.XSToNative(GetXSDate(edtdate_dovvod.DateTime));
     end
     else
       ENReconstrModern2OSDataFilterObj.date_dovvod := nil;



     ENReconstrModern2OSDataFilterObj.kod_inv := edtKod_inv.Text; 



     ENReconstrModern2OSDataFilterObj.kod_ist := edtKod_ist.Text; 



     ENReconstrModern2OSDataFilterObj.name_ist := edtName_ist.Text; 



     if (ENReconstrModern2OSDataFilterObj.sum_dovvod_n = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_n := TXSDecimal.Create;
     if edtSum_dovvod_n.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_n.decimalString := edtSum_dovvod_n.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_dovvod_n := nil;




     if (ENReconstrModern2OSDataFilterObj.sum_dovvod_b = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_b := TXSDecimal.Create;
     if edtSum_dovvod_b.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_b.decimalString := edtSum_dovvod_b.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_dovvod_b := nil;




     if (ENReconstrModern2OSDataFilterObj.sum_nds = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_nds := TXSDecimal.Create;
     if edtSum_nds.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_nds.decimalString := edtSum_nds.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_nds := nil;




     if (ENReconstrModern2OSDataFilterObj.sum_dovvod_nds_b = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_nds_b := TXSDecimal.Create;
     if edtSum_dovvod_nds_b.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_nds_b.decimalString := edtSum_dovvod_nds_b.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_dovvod_nds_b := nil;




     if (ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_n = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_n := TXSDecimal.Create;
     if edtSum_dovvod_izn_n.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_n.decimalString := edtSum_dovvod_izn_n.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_n := nil;




     if (ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_b = nil ) then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_b := TXSDecimal.Create;
     if edtSum_dovvod_izn_b.Text <> '' then
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_b.decimalString := edtSum_dovvod_izn_b.Text 
     else
       ENReconstrModern2OSDataFilterObj.sum_dovvod_izn_b := nil;




     ENReconstrModern2OSDataFilterObj.name_dovvod := edtName_dovvod.Text; 



     ENReconstrModern2OSDataFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENReconstrModern2OSDataFilterObj.dateEdit = nil then
          ENReconstrModern2OSDataFilterObj.dateEdit := TXSDateTime.Create;
       ENReconstrModern2OSDataFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENReconstrModern2OSDataFilterObj.dateEdit := nil;



     ENReconstrModern2OSDataFilterObj.kod_nakl := edtKod_nakl.Text; 



     if edtdt_nakl.checked then
     begin 
       if ENReconstrModern2OSDataFilterObj.dt_nakl = nil then
          ENReconstrModern2OSDataFilterObj.dt_nakl := TXSDateTime.Create;
       ENReconstrModern2OSDataFilterObj.dt_nakl.XSToNative(GetXSDate(edtdt_nakl.DateTime));
     end
     else
       ENReconstrModern2OSDataFilterObj.dt_nakl := nil;



     ENReconstrModern2OSDataFilterObj.kod_nal_nakl := edtKod_nal_nakl.Text; 



     ENReconstrModern2OSDataFilterObj.kod_postav := edtKod_postav.Text; 



     ENReconstrModern2OSDataFilterObj.kod_dogovor := edtKod_dogovor.Text; 



     if edtdateBuh.checked then
     begin 
       if ENReconstrModern2OSDataFilterObj.dateBuh = nil then
          ENReconstrModern2OSDataFilterObj.dateBuh := TXSDateTime.Create;
       ENReconstrModern2OSDataFilterObj.dateBuh.XSToNative(GetXSDate(edtdateBuh.DateTime));
     end
     else
       ENReconstrModern2OSDataFilterObj.dateBuh := nil;




  end;
end;




end.