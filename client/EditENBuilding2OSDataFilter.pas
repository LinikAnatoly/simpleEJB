
unit EditENBuilding2OSDataFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBuilding2OSDataController ;

type
  TfrmENBuilding2OSDataFilterEdit = class(TDialogForm)

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
  frmENBuilding2OSDataFilterEdit: TfrmENBuilding2OSDataFilterEdit;
  ENBuilding2OSDataFilterObj: ENBuilding2OSDataFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBuilding2OSDataController  ;
}
{$R *.dfm}



procedure TfrmENBuilding2OSDataFilterEdit.FormShow(Sender: TObject);

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

    if ( ENBuilding2OSDataObj.num_un <> Low(Integer) ) then
       edtNum_un.Text := IntToStr(ENBuilding2OSDataObj.num_un)
    else
       edtNum_un.Text := '';



    if ( ENBuilding2OSDataObj.num_dovvod <> Low(Integer) ) then
       edtNum_dovvod.Text := IntToStr(ENBuilding2OSDataObj.num_dovvod)
    else
       edtNum_dovvod.Text := '';



      if ENBuilding2OSDataObj.date_dovvod <> nil then
      begin
        edtDate_dovvod.DateTime:=EncodeDate(ENBuilding2OSDataObj.date_dovvod.Year,ENBuilding2OSDataObj.date_dovvod.Month,ENBuilding2OSDataObj.date_dovvod.Day);
        edtDate_dovvod.checked := true;
      end
      else
      begin
        edtDate_dovvod.DateTime:=SysUtils.Date;
        edtDate_dovvod.checked := false;
      end;



    edtKod_inv.Text := ENBuilding2OSDataObj.kod_inv; 



    edtKod_ist.Text := ENBuilding2OSDataObj.kod_ist; 



    edtName_ist.Text := ENBuilding2OSDataObj.name_ist; 



    if ( ENBuilding2OSDataObj.sum_dovvod_n <> nil ) then
       edtSum_dovvod_n.Text := ENBuilding2OSDataObj.sum_dovvod_n.decimalString
    else
       edtSum_dovvod_n.Text := ''; 



    if ( ENBuilding2OSDataObj.sum_dovvod_b <> nil ) then
       edtSum_dovvod_b.Text := ENBuilding2OSDataObj.sum_dovvod_b.decimalString
    else
       edtSum_dovvod_b.Text := ''; 



    if ( ENBuilding2OSDataObj.sum_nds <> nil ) then
       edtSum_nds.Text := ENBuilding2OSDataObj.sum_nds.decimalString
    else
       edtSum_nds.Text := ''; 



    if ( ENBuilding2OSDataObj.sum_dovvod_nds_b <> nil ) then
       edtSum_dovvod_nds_b.Text := ENBuilding2OSDataObj.sum_dovvod_nds_b.decimalString
    else
       edtSum_dovvod_nds_b.Text := ''; 



    if ( ENBuilding2OSDataObj.sum_dovvod_izn_n <> nil ) then
       edtSum_dovvod_izn_n.Text := ENBuilding2OSDataObj.sum_dovvod_izn_n.decimalString
    else
       edtSum_dovvod_izn_n.Text := ''; 



    if ( ENBuilding2OSDataObj.sum_dovvod_izn_b <> nil ) then
       edtSum_dovvod_izn_b.Text := ENBuilding2OSDataObj.sum_dovvod_izn_b.decimalString
    else
       edtSum_dovvod_izn_b.Text := ''; 



    MakeMultiline(edtName_dovvod.Lines, ENBuilding2OSDataObj.name_dovvod);



    edtUserGen.Text := ENBuilding2OSDataObj.userGen; 



      if ENBuilding2OSDataObj.dateEdit <> nil then
      begin
        edtDateEdit.DateTime:=EncodeDate(ENBuilding2OSDataObj.dateEdit.Year,ENBuilding2OSDataObj.dateEdit.Month,ENBuilding2OSDataObj.dateEdit.Day);
        edtDateEdit.checked := true;
      end
      else
      begin
        edtDateEdit.DateTime:=SysUtils.Date;
        edtDateEdit.checked := false;
      end;	  



    edtKod_nakl.Text := ENBuilding2OSDataObj.kod_nakl; 



      if ENBuilding2OSDataObj.dt_nakl <> nil then
      begin
        edtDt_nakl.DateTime:=EncodeDate(ENBuilding2OSDataObj.dt_nakl.Year,ENBuilding2OSDataObj.dt_nakl.Month,ENBuilding2OSDataObj.dt_nakl.Day);
        edtDt_nakl.checked := true;
      end
      else
      begin
        edtDt_nakl.DateTime:=SysUtils.Date;
        edtDt_nakl.checked := false;
      end;	  



    edtKod_nal_nakl.Text := ENBuilding2OSDataObj.kod_nal_nakl; 



    edtKod_postav.Text := ENBuilding2OSDataObj.kod_postav; 



    edtKod_dogovor.Text := ENBuilding2OSDataObj.kod_dogovor; 



      if ENBuilding2OSDataObj.dateBuh <> nil then
      begin
        edtDateBuh.DateTime:=EncodeDate(ENBuilding2OSDataObj.dateBuh.Year,ENBuilding2OSDataObj.dateBuh.Month,ENBuilding2OSDataObj.dateBuh.Day);
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



procedure TfrmENBuilding2OSDataFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBuilding2OSData: ENBuilding2OSDataControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtNum_un.Text <> '' ) then
       ENBuilding2OSDataFilterObj.num_un := StrToInt(edtNum_un.Text)
     else
       ENBuilding2OSDataFilterObj.num_un := Low(Integer) ;
	   



     if ( edtNum_dovvod.Text <> '' ) then
       ENBuilding2OSDataFilterObj.num_dovvod := StrToInt(edtNum_dovvod.Text)
     else
       ENBuilding2OSDataFilterObj.num_dovvod := Low(Integer) ;
	   



     if edtdate_dovvod.checked then
     begin 
       if ENBuilding2OSDataFilterObj.date_dovvod = nil then
          ENBuilding2OSDataFilterObj.date_dovvod := TXSDate.Create;
       ENBuilding2OSDataFilterObj.date_dovvod.XSToNative(GetXSDate(edtdate_dovvod.DateTime));
     end
     else
       ENBuilding2OSDataFilterObj.date_dovvod := nil;



     ENBuilding2OSDataFilterObj.kod_inv := edtKod_inv.Text; 



     ENBuilding2OSDataFilterObj.kod_ist := edtKod_ist.Text; 



     ENBuilding2OSDataFilterObj.name_ist := edtName_ist.Text; 



     if (ENBuilding2OSDataFilterObj.sum_dovvod_n = nil ) then
       ENBuilding2OSDataFilterObj.sum_dovvod_n := TXSDecimal.Create;
     if edtSum_dovvod_n.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_dovvod_n.decimalString := edtSum_dovvod_n.Text 
     else
       ENBuilding2OSDataFilterObj.sum_dovvod_n := nil;




     if (ENBuilding2OSDataFilterObj.sum_dovvod_b = nil ) then
       ENBuilding2OSDataFilterObj.sum_dovvod_b := TXSDecimal.Create;
     if edtSum_dovvod_b.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_dovvod_b.decimalString := edtSum_dovvod_b.Text 
     else
       ENBuilding2OSDataFilterObj.sum_dovvod_b := nil;




     if (ENBuilding2OSDataFilterObj.sum_nds = nil ) then
       ENBuilding2OSDataFilterObj.sum_nds := TXSDecimal.Create;
     if edtSum_nds.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_nds.decimalString := edtSum_nds.Text 
     else
       ENBuilding2OSDataFilterObj.sum_nds := nil;




     if (ENBuilding2OSDataFilterObj.sum_dovvod_nds_b = nil ) then
       ENBuilding2OSDataFilterObj.sum_dovvod_nds_b := TXSDecimal.Create;
     if edtSum_dovvod_nds_b.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_dovvod_nds_b.decimalString := edtSum_dovvod_nds_b.Text 
     else
       ENBuilding2OSDataFilterObj.sum_dovvod_nds_b := nil;




     if (ENBuilding2OSDataFilterObj.sum_dovvod_izn_n = nil ) then
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_n := TXSDecimal.Create;
     if edtSum_dovvod_izn_n.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_n.decimalString := edtSum_dovvod_izn_n.Text 
     else
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_n := nil;




     if (ENBuilding2OSDataFilterObj.sum_dovvod_izn_b = nil ) then
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_b := TXSDecimal.Create;
     if edtSum_dovvod_izn_b.Text <> '' then
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_b.decimalString := edtSum_dovvod_izn_b.Text 
     else
       ENBuilding2OSDataFilterObj.sum_dovvod_izn_b := nil;




     ENBuilding2OSDataFilterObj.name_dovvod := edtName_dovvod.Text; 



     ENBuilding2OSDataFilterObj.userGen := edtUserGen.Text; 



     if edtdateEdit.checked then
     begin 
       if ENBuilding2OSDataFilterObj.dateEdit = nil then
          ENBuilding2OSDataFilterObj.dateEdit := TXSDateTime.Create;
       ENBuilding2OSDataFilterObj.dateEdit.XSToNative(GetXSDate(edtdateEdit.DateTime));
     end
     else
       ENBuilding2OSDataFilterObj.dateEdit := nil;



     ENBuilding2OSDataFilterObj.kod_nakl := edtKod_nakl.Text; 



     if edtdt_nakl.checked then
     begin 
       if ENBuilding2OSDataFilterObj.dt_nakl = nil then
          ENBuilding2OSDataFilterObj.dt_nakl := TXSDateTime.Create;
       ENBuilding2OSDataFilterObj.dt_nakl.XSToNative(GetXSDate(edtdt_nakl.DateTime));
     end
     else
       ENBuilding2OSDataFilterObj.dt_nakl := nil;



     ENBuilding2OSDataFilterObj.kod_nal_nakl := edtKod_nal_nakl.Text; 



     ENBuilding2OSDataFilterObj.kod_postav := edtKod_postav.Text; 



     ENBuilding2OSDataFilterObj.kod_dogovor := edtKod_dogovor.Text; 



     if edtdateBuh.checked then
     begin 
       if ENBuilding2OSDataFilterObj.dateBuh = nil then
          ENBuilding2OSDataFilterObj.dateBuh := TXSDateTime.Create;
       ENBuilding2OSDataFilterObj.dateBuh.XSToNative(GetXSDate(edtdateBuh.DateTime));
     end
     else
       ENBuilding2OSDataFilterObj.dateBuh := nil;




  end;
end;




end.