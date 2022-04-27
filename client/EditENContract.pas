
unit EditENContract;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContractController, ExtCtrls,
  AdvObj ,ENContractItemController  ;

type
  TfrmENContractEdit = class(TDialogForm)
  
    lblCode : TLabel;
	edtCode : TEdit;
  

  HTTPRIOENContract: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    Panel1: TPanel;
    lblContractNumber: TLabel;
    lblContractDate: TLabel;
    lblFinDocCode: TLabel;
    lblCommentGen: TLabel;
    Label1: TLabel;
    edtContractNumber: TEdit;
    edtContractDate: TDateTimePicker;
    edtFinDocCode: TEdit;
    edtCommentGen: TEdit;
    edtContractEndDate: TDateTimePicker;
    Splitter1: TSplitter;
    Panel2: TPanel;
    ImageList1: TImageList;
    HTTPRIOENContractItem: THTTPRIO;
    ActionList1: TActionList;
    actView: TAction;
    actInsert: TAction;
    actDelete: TAction;
    actEdit: TAction;
    actUpdate: TAction;
    actFilter: TAction;
    actNoFilter: TAction;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    sgENContractItem: TAdvStringGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    lblTKMaterialsMaterialName: TLabel;
    edtRQOrgOrgName: TEdit;
    spbRQOrgOrg: TSpeedButton;
    spbContractNumber: TSpeedButton;
    spbContractNumberClear: TSpeedButton;
    btnFilterMaterial: TToolButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbRQOrgOrgClick(Sender : TObject);
    procedure actUpdateExecute(Sender: TObject);
    procedure actViewExecute(Sender: TObject);
    procedure sgENContractItemDblClick(Sender: TObject);
    procedure actInsertExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure spbContractNumberClick(Sender: TObject);
    procedure actFilterExecute(Sender: TObject);
  
  private
    { Private declarations }
    contractitemfil : ENContractItemFilter;
  public
    { Public declarations }


end;

var
  frmENContractEdit: TfrmENContractEdit;
  ENContractObj: ENContract;

   ENContractItemHeaders: array [1..8] of String =
        ( 'Код'
          ,'Матеріал'
          ,'Кількість за договором'
          ,'Ціна'
          ,'Вартість'
          ,'Користувач'
					,'Дата зміни'
					,'Кількість фактична'
        );

implementation

uses
  ShowRQOrg
  ,RQOrgController
, EditENContractItem, ENConsts,
  EditFINServicesObjectFilter, ShowFINServicesObject,
  ENServicesObjectController, ENContractTypeController, DMReportsUnit, EditENContractItemFilter;

{uses  
    EnergyproController, EnergyproController2, ENContractController  ;
}
{$R *.dfm}



procedure TfrmENContractEdit.FormShow(Sender: TObject);

begin
  DisableControls([edtCode, edtFinDocCode]);

  if DialogState = dsView then
  begin
    DisableControls([
       ]);
  end;

    if DialogState = dsView then
  begin
    DisableActions([actEdit , actInsert , actDelete  ]);
  end;

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

    DisableControls([ edtContractDate ]);

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin
      edtCode.Text := IntToStr(ENContractObj.code);
      edtContractNumber.Text := ENContractObj.contractNumber;

      if ENContractObj.contractDate <> nil then
      begin
        edtContractDate.DateTime:=EncodeDate(ENContractObj.contractDate.Year,ENContractObj.contractDate.Month,ENContractObj.contractDate.Day);
        edtContractDate.checked := true;
      end
      else
      begin
        edtContractDate.DateTime:=SysUtils.Date;
        edtContractDate.checked := false;
      end;

      if ENContractObj.contractEndDate <> nil then
      begin
        edtContractEndDate.DateTime:=EncodeDate(ENContractObj.contractEndDate.Year,ENContractObj.contractEndDate.Month,ENContractObj.contractEndDate.Day);
        edtContractEndDate.checked := true;
      end
      else
      begin
        edtContractEndDate.DateTime:=SysUtils.Date;
        edtContractEndDate.checked := false;
      end;

    edtFinDocCode.Text := ENContractObj.finDocCode;
    edtCommentGen.Text := ENContractObj.commentGen;

    actUpdateExecute(Sender);

  end;
end;



procedure TfrmENContractEdit.actDeleteExecute(Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
  ObjCode: Integer;
begin
 TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;
   try
     ObjCode := StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Позиція договору) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempENContractItem.remove(ObjCode);
      actUpdateExecute(Sender);
  end;
end;

procedure TfrmENContractEdit.actEditExecute(Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
begin
 TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;
   try
     ENContractItemObj := TempENContractItem.getObject(StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractItemEdit:=TfrmENContractItemEdit.Create(Application, dsEdit);
  try
    if frmENContractItemEdit.ShowModal= mrOk then
      begin
        actUpdateExecute(Sender);
      end;
  finally
    frmENContractItemEdit.Free;
    frmENContractItemEdit:=nil;
  end;
end;

procedure TfrmENContractEdit.actFilterExecute(Sender: TObject);
begin
  // inherited;
 frmENContractItemFilterEdit:=TfrmENContractItemFilterEdit.Create(Application, dsEdit);
  try
    ENContractItemFilterObj := ENContractItemFilter.Create;
    SetNullIntProps(ENContractItemFilterObj);
    SetNullXSProps(ENContractItemFilterObj);

    ENContractItemFilterObj.contract := ENContractObj.Create;
    ENContractItemFilterObj.contract.code := ENContractObj.code;

    if frmENContractItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContractItemFilter.Create;
      contractitemfil  := ENContractItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally

    frmENContractItemFilterEdit.Free;
    frmENContractItemFilterEdit:=nil;
  end;
end;

procedure TfrmENContractEdit.actInsertExecute(Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
begin
  TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;

  ENContractItemObj:=ENContractItem.Create;
  ENContractItemObj.contract := ENContract.Create;
  ENContractItemObj.contract.code := ENContractObj.code;

  try
    frmENContractItemEdit := TfrmENContractItemEdit.Create(Application, dsInsert);
    frmENContractItemEdit.edtENContractContractName.Text := ENContractObj.contractNumber;
    try

      if frmENContractItemEdit.ShowModal = mrOk then
      begin
        if ENContractItemObj<>nil then
        begin
          actUpdateExecute(Sender);
        end;
      end;
    finally
      frmENContractItemEdit.Free;
      frmENContractItemEdit:=nil;
    end;
  finally
    ENContractItemObj.Free;
  end;
end;

procedure TfrmENContractEdit.actUpdateExecute(Sender: TObject);
var
  TempENContractItem: ENContractItemControllerSoapPort;
  i: Integer;
  ENContractItemList: ENContractItemShortList;
  LastRow: Integer;
begin
  LastRow:= 1;
  // Пока прикроем
  DisableActions([{actFilter,} actNoFilter]);

  SetGridHeaders(ENContractItemHeaders, sgENContractItem.ColumnHeaders);

  TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;



  if contractitemfil = nil then
  begin
    contractitemfil := ENContractItemFilter.Create;
    SetNullIntProps(contractitemfil);
    SetNullXSProps(contractitemfil);
  end;
    contractitemfil.contract := ENContract.Create;
    contractitemfil.contract.code := ENContractObj.code;


  ENContractItemList := TempENContractItem.getScrollableFilteredList(contractitemfil,0,-1);

  if High(ENContractItemList.list) > -1 then
     sgENContractItem.RowCount:=High(ENContractItemList.list)+2
  else
     sgENContractItem.RowCount:=2;

   with sgENContractItem do
    for i:=0 to High(ENContractItemList.list) do
      begin
        Application.ProcessMessages;

        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+1] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+1] := '';
        Cells[1,i+1] := ENContractItemList.list[i].materialName;

        Objects[1,i+1] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := ENContractItemList.list[i].countGen.DecimalString;
        if ENContractItemList.list[i].price = nil then
          Cells[3,i+1] := ''
        else
          Cells[3,i+1] := ENContractItemList.list[i].price.DecimalString;
        if ENContractItemList.list[i].cost = nil then
          Cells[4,i+1] := ''
        else
          Cells[4,i+1] := ENContractItemList.list[i].cost.DecimalString;
        Cells[5,i+1] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[6,i+1] := ''
        else
					Cells[6,i+1] := XSDate2String(ENContractItemList.list[i].dateEdit);

					if ENContractItemList.list[i].countReal = nil then
					Cells[7,i+1] := ''
				else
					Cells[7,i+1] := ENContractItemList.list[i].countReal.DecimalString;
        LastRow:=i+1;
        sgENContractItem.RowCount:=LastRow+1;
      end;

   sgENContractItem.Row:=1;
end;

procedure TfrmENContractEdit.actViewExecute(Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
begin
 TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;
   try
     ENContractItemObj := TempENContractItem.getObject(StrToInt(sgENContractItem.Cells[0,sgENContractItem.Row]));
   except
   on EConvertError do Exit;
  end;
  frmENContractItemEdit:=TfrmENContractItemEdit.Create(Application, dsView);
  try
    frmENContractItemEdit.ShowModal;
  finally
    frmENContractItemEdit.Free;
    frmENContractItemEdit:=nil;
  end;
end;

procedure TfrmENContractEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContract: ENContractControllerSoapPort;
begin
  if (ModalResult = mrOk) and ((DialogState = dsEdit) or (DialogState = dsInsert)) then
  if not NoBlankValues([
     ])  then
  begin
      Application.MessageBox(PChar('Пустые поля недопустимы !'),PChar('Внимание !'),MB_ICONWARNING+MB_OK);
      Action:=caNone;
  end
  else
  begin
    TempENContract := HTTPRIOENContract as ENContractControllerSoapPort;


     ENContractObj.contractNumber := edtContractNumber.Text; 

     if edtcontractDate.checked then
     begin 
       if ENContractObj.contractDate = nil then
          ENContractObj.contractDate := TXSDate.Create;
       ENContractObj.contractDate.XSToNative(GetXSDate(edtcontractDate.DateTime));
     end
     else
       ENContractObj.contractDate := nil;

      if edtContractEndDate.checked then
     begin
       if ENContractObj.contractEndDate = nil then
          ENContractObj.contractEndDate := TXSDate.Create;
       ENContractObj.contractEndDate.XSToNative(GetXSDate(edtContractEndDate.DateTime));
     end
     else
       ENContractObj.contractEndDate := nil;

     ENContractObj.finDocCode := edtFinDocCode.Text;

     ENContractObj.commentGen := edtCommentGen.Text;



   if DialogState = dsInsert then
    begin
      ENContractObj.code:=low(Integer);
      ENContractObj.contractType:= ENContractType.Create;
      ENContractObj.contractType.code:= ENConsts.ENCONTRACTTYPE_AGREE;
      TempENContract.add(ENContractObj);
    end
    else
    if DialogState = dsEdit then
    begin
      TempENContract.save(ENContractObj);
    end;
  end;
end;


procedure TfrmENContractEdit.sgENContractItemDblClick(Sender: TObject);
begin
   actViewExecute(Sender);
end;

procedure TfrmENContractEdit.spbContractNumberClick(Sender: TObject);
var
   frmFINServicesObjectShow: TfrmFINServicesObjectShow;
   f : ENServicesObjectFilter;
begin
   f := ENServicesObjectFilter.Create();
   SetNullXSProps(f);
   SetNullIntProps(f);

   if (ENContractObj.org <> nil) then
   begin
     if (ENContractObj.org.id > LOW_INT) then
       f.conditionSQL := ' a.io_flag = ''B'' and p.id = ' + IntToStr(ENContractObj.org.id)
     else
       f.conditionSQL := ' a.io_flag = ''B''';
   end
   else
   begin
     Application.MessageBox(PChar('Виберіть постачальника!!!'),PChar('Увага!!!'),MB_ICONWARNING+MB_OK);
     Exit;
   end;

   frmFINServicesObjectShow:=TfrmFINServicesObjectShow.Create(Application,fmNormal, f);
   frmFINServicesObjectShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmFINServicesObjectShow do
        if ShowModal = mrOk then
        begin
            try

                edtContractNumber.Text := GetReturnValue(sgFINServicesObject, 1);
                ENContractObj.contractNumber := GetReturnValue(sgFINServicesObject, 1);
                ENContractObj.contractDate := TXSDate.Create;
                ENContractObj.contractDate.XSToNative(GetXSDate( StrToDate(GetReturnValue(sgFINServicesObject, 2)) ));
                edtContractDate.DateTime:=EncodeDate(ENContractObj.contractDate.Year,ENContractObj.contractDate.Month,ENContractObj.contractDate.Day);
                edtContractDate.checked := true;
                ENContractObj.finDocCode  := GetReturnValue(sgFINServicesObject, 5);
                edtFinDocCode.Text := GetReturnValue(sgFINServicesObject, 5);;
                ENContractObj.finDocId := StrToInt(GetReturnValue(sgFINServicesObject, 6));


             except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmFINServicesObjectShow.Free;
   end;
end;

procedure TfrmENContractEdit.spbRQOrgOrgClick(Sender : TObject);
//var
//   frmRQOrgShow: TfrmRQOrgShow;
//begin
//   frmRQOrgShow:=TfrmRQOrgShow.Create(Application,fmNormal);
//   try
//      with frmRQOrgShow do
//        if ShowModal = mrOk then
//        begin
//            try
//               if ENContractObj.org = nil then ENContractObj.org := RQOrg.Create();
//               ENContractObj.org.code := StrToInt(GetReturnValue(sgRQOrg,0));
//
//            except
//               on EConvertError do Exit;
//            end;
//        end;
//   finally
//      frmRQOrgShow.Free;
//   end;
//end;
var
   frmRQOrgShow: TfrmRQOrgShow;
   tmpOrg: RQOrg;
   TempRQOrg : RQOrgControllerSoapPort;
   sDate, lDate, nDate: String;
begin
{
   frmRQOrgShow := TfrmRQOrgShow.Create(Application,fmNormal);
   frmRQOrgShow.contrAgentType := AX_CONTRAGENT_TYPE_VENDOR;
   try
      with frmRQOrgShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContractObj.org = nil then
               begin
                ENContractObj.org := RQOrg.Create();
                SetNullIntProps(ENContractObj.org);
                SetNullXSProps(ENContractObj.org);
               end;

               edtRQOrgOrgName.Text := GetReturnValue(sgRQOrg,1);

               ENContractObj.org.id := StrToInt(GetReturnValue(sgRQOrg,0)); // по ИД будем смотреть на серваке ...
               ENContractObj.org.codeorg := GetReturnValue(sgRQOrg,8);
               ENContractObj.org.name := GetReturnValue(sgRQOrg,1);
               ENContractObj.org.ukr_name := GetReturnValue(sgRQOrg,9);
               ENContractObj.org.okpo := GetReturnValue(sgRQOrg,2);
               ENContractObj.org.nalog_num := GetReturnValue(sgRQOrg,3);
               ENContractObj.org.svidet_num := GetReturnValue(sgRQOrg,4);
               ENContractObj.org.adr := GetReturnValue(sgRQOrg,5);
               ENContractObj.org.tel := GetReturnValue(sgRQOrg,6);
               ENContractObj.org.country := GetReturnValue(sgRQOrg,10);
               ENContractObj.org.region := GetReturnValue(sgRQOrg,11);
               ENContractObj.org.ministry := GetReturnValue(sgRQOrg,12);
               ENContractObj.org.ownership := StrToInt(GetReturnValue(sgRQOrg,13));
               ENContractObj.org.type_ := GetReturnValue(sgRQOrg,14);
               ENContractObj.org.master_code := GetReturnValue(sgRQOrg,15);

               sDate := GetReturnValue(sgRQOrg,16);
                 if sDate <> '' then
                   begin
                    ENContractObj.org.date_svidet := TXSDate.Create;
                    ENContractObj.org.date_svidet.XSToNative(GetXSDate(StrToDate(sDate)));
                   end;
               lDate := GetReturnValue(sgRQOrg,17);
                 if lDate <> '' then
                   begin
                    ENContractObj.org.likv_date := TXSDate.Create;
                    ENContractObj.org.likv_date.XSToNative(GetXSDate(StrToDate(lDate)));
                   end;

               ENContractObj.org.except_flag := GetReturnValue(sgRQOrg,18);
               ENContractObj.org.likv_flag := GetReturnValue(sgRQOrg,19);
               ENContractObj.org.budget_flag := GetReturnValue(sgRQOrg,20);

               nDate := GetReturnValue(sgRQOrg,21);
                 if nDate <> '' then
                   begin
                    ENContractObj.org.date_nalogform := TXSDate.Create;
                    ENContractObj.org.date_nalogform.XSToNative(GetXSDate(StrToDate(nDate)));
                   end;

               ENContractObj.org.id_nalogform := StrToInt(GetReturnValue(sgRQOrg,22));
               ENContractObj.org.adr_legal := GetReturnValue(sgRQOrg,23);
               ENContractObj.org.Primechan := GetReturnValue(sgRQOrg,7);



            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmRQOrgShow.Free;
   end;
}
  if DMReports.selectRQOrg(tmpOrg, AX_CONTRAGENT_TYPE_VENDOR, ENContractObj.org) then
  begin
    ENContractObj.org := tmpOrg;
    edtRQOrgOrgName.Text := ENContractObj.org.name;
  end;
end;


end.
