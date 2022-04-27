
unit ShowENContractItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns,
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  ENContractItemController, RQOrgController, AdvObj ;


type
  TfrmENContractItemShow = class(TChildForm)  
  HTTPRIOENContractItem: THTTPRIO;
    ImageList1: TImageList;
    sgENContractItem: TAdvStringGrid;
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
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton11: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;

procedure FormShow(Sender: TObject);
procedure FormClose(Sender: TObject; var Action: TCloseAction);
procedure sgENContractItemTopLeftChanged(Sender: TObject);
procedure sgENContractItemDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
   { Private declarations }
 public
   { Public declarations }
   contractCode: Integer;
   contractDescription: String;

   /////
   org: RQOrg;
   contractNumber: String;
   contractDate: TDate;
   finDocCode: String;
   finDocID: Integer;
   /////
   
   procedure UpdateGrid(Sender: TObject);
 end;

//var
 // ENContractItemObj: ENContractItem;
 // ENContractItemFilterObj: ENContractItemFilter;
  
  
implementation

uses Main, EditENContractItem, EditENContractItemFilter,
  ENContractController, ENConsts, DMReportsUnit;


{$R *.dfm}

var
  //frmENContractItemShow : TfrmENContractItemShow;

  
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;
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
   

procedure TfrmENContractItemShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    if FormMode = fmChild then
      frmENContractItemShow:=nil;
    inherited;
  end;


procedure TfrmENContractItemShow.FormShow(Sender: TObject);
var
  TempENContractItem: ENContractItemControllerSoapPort;
  i: Integer;
  ENContractItemList: ENContractItemShortList;
begin
  // Пока прикроем
  DisableActions([actFilter, actNoFilter]);

  SetGridHeaders(ENContractItemHeaders, sgENContractItem.ColumnHeaders);
  ColCount:=100;
  TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := ENContractItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  if ENContractItemFilter(FilterObject).contract <> nil then
    if (contractCode > 0) and (ENContractItemFilter(FilterObject).contract.code < 0) then
      ENContractItemFilter(FilterObject).contract.code := contractCode;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilter(FilterObject),0,ColCount);


  LastCount:=High(ENContractItemList.list);

  if LastCount > -1 then
     sgENContractItem.RowCount:=LastCount+2
  else
     sgENContractItem.RowCount:=2;

{
        ( 'Код'
          ,'Матеріал'
          ,'Кількість за договором'
          ,'Ціна'
          ,'Вартість'
          ,'Користувач'
          ,'Дата зміни'
        );
}
   with sgENContractItem do
    for i:=0 to LastCount do
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
   ColCount:=ColCount+1;
   sgENContractItem.Row:=1;
end;

procedure TfrmENContractItemShow.sgENContractItemTopLeftChanged(Sender: TObject);
var
  TempENContractItem: ENContractItemControllerSoapPort;
  i,CurrentRow: Integer;
  ENContractItemList: ENContractItemShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgENContractItem.TopRow + sgENContractItem.VisibleRowCount) = ColCount
  then
    begin
      TempENContractItem :=  HTTPRIOENContractItem as ENContractItemControllerSoapPort;
      CurrentRow:=sgENContractItem.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := ENContractItemFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
  end;

  ENContractItemList := TempENContractItem.getScrollableFilteredList(ENContractItemFilter(FilterObject),ColCount-1, 100);



  sgENContractItem.RowCount:=sgENContractItem.RowCount+100;
  LastCount:=High(ENContractItemList.list);
  with sgENContractItem do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if ENContractItemList.list[i].code <> Low(Integer) then
          Cells[0,i+CurrentRow] := IntToStr(ENContractItemList.list[i].code)
        else
          Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := ENContractItemList.list[i].materialName;

        Objects[1,i+CurrentRow] := TObject(ENContractItemList.list[i].materialCode);

        if ENContractItemList.list[i].countGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := ENContractItemList.list[i].countGen.DecimalString;
        if ENContractItemList.list[i].price = nil then
          Cells[3,i+CurrentRow] := ''
        else
          Cells[3,i+CurrentRow] := ENContractItemList.list[i].price.DecimalString;
        if ENContractItemList.list[i].cost = nil then
          Cells[4,i+CurrentRow] := ''
        else
          Cells[4,i+CurrentRow] := ENContractItemList.list[i].cost.DecimalString;
        Cells[5,i+CurrentRow] := ENContractItemList.list[i].userGen;
        if ENContractItemList.list[i].dateEdit = nil then
          Cells[6,i+CurrentRow] := ''
        else
					Cells[6,i+CurrentRow] := XSDate2String(ENContractItemList.list[i].dateEdit);

				if ENContractItemList.list[i].countReal = nil then
					Cells[7,i+CurrentRow] := ''
				else
					Cells[7,i+CurrentRow] := ENContractItemList.list[i].countReal.DecimalString;

        LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgENContractItem.Row:=CurrentRow-5;
   sgENContractItem.RowCount:=LastRow+1;
  end;
end;

procedure TfrmENContractItemShow.sgENContractItemDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin

    try
      temp:=StrToInt(GetReturnValue(sgENContractItem,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
    
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmENContractItemShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgENContractItem.RowCount-1 do
   for j:=0 to sgENContractItem.ColCount-1 do
     sgENContractItem.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmENContractItemShow.actViewExecute(Sender: TObject);
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

procedure TfrmENContractItemShow.actEditExecute(Sender: TObject);
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
        //TempENContractItem.save(ENContractItemObj);
        UpdateGrid(Sender);
      end;
  finally
    frmENContractItemEdit.Free;
    frmENContractItemEdit:=nil;
  end;
end;

procedure TfrmENContractItemShow.actDeleteExecute(Sender: TObject);
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
      UpdateGrid(Sender);
  end;
end;

procedure TfrmENContractItemShow.actInsertExecute(Sender: TObject);
Var TempENContractItem: ENContractItemControllerSoapPort;
begin
  TempENContractItem := HTTPRIOENContractItem as ENContractItemControllerSoapPort;

  ENContractItemObj:=ENContractItem.Create;
  //ENContractItemObj.countGen:= TXSDecimal.Create;
  //ENContractItemObj.price:= TXSDecimal.Create;
  //ENContractItemObj.cost:= TXSDecimal.Create;
  //ENContractItemObj.dateEdit:= TXSDate.Create;
  ENContractItemObj.contract := ENContract.Create;
  ENContractItemObj.contract.code := contractCode;
  // Если договора еще нет в нашей т-це encontract, будем закидывать его туда на серваке
  if contractCode = LOW_INT then
  begin
      /// Организация //////////////////////////////////////////////////////////
      {
      ENContractItemObj.contract.org := RQOrg.Create();
      SetNullIntProps(ENContractItemObj.contract.org);
      SetNullXSProps(ENContractItemObj.contract.org);

      ENContractItemObj.contract.org.id := org.id; // по ИД будем смотреть на серваке ...
      ENContractItemObj.contract.org.codeorg := org.codeorg;
      ENContractItemObj.contract.org.name := org.name;
      ENContractItemObj.contract.org.ukr_name := org.ukr_name;
      ENContractItemObj.contract.org.okpo := org.okpo;
      ENContractItemObj.contract.org.nalog_num := org.nalog_num;
      ENContractItemObj.contract.org.svidet_num := org.svidet_num;
      ENContractItemObj.contract.org.adr := org.adr;
      ENContractItemObj.contract.org.tel := org.tel;
      ENContractItemObj.contract.org.country := org.country;
      ENContractItemObj.contract.org.region := org.region;
      ENContractItemObj.contract.org.ministry := org.ministry;
      ENContractItemObj.contract.org.ownership := org.ownership;
      ENContractItemObj.contract.org.type_ := org.type_;
      ENContractItemObj.contract.org.master_code := org.master_code;

      //ENContractItemObj.contract.org.date_svidet := TXSDate.Create;
      //ENContractItemObj.contract.org.likv_date := TXSDate.Create;
      //ENContractItemObj.contract.org.dateNalogform := TXSDate.Create;

      if org.date_svidet <> nil then
      begin
        ENContractItemObj.contract.org.date_svidet := TXSDate.Create;
        ENContractItemObj.contract.org.date_svidet.XSToNative(org.date_svidet.NativeToXS);
      end;

      if org.likv_date <> nil then
      begin
        ENContractItemObj.contract.org.likv_date := TXSDate.Create;
        ENContractItemObj.contract.org.likv_date.XSToNative(org.likv_date.NativeToXS);
      end;

      if org.date_nalogform <> nil then
      begin
        ENContractItemObj.contract.org.date_nalogform := TXSDate.Create;
        ENContractItemObj.contract.org.date_nalogform.XSToNative(org.date_nalogform.NativeToXS);
      end;      

      ENContractItemObj.contract.org.except_flag := org.except_flag;
      ENContractItemObj.contract.org.likv_flag := org.likv_flag;
      ENContractItemObj.contract.org.budget_flag := org.budget_flag;

      ENContractItemObj.contract.org.id_nalogform := org.id_nalogform;
      ENContractItemObj.contract.org.adr_legal := org.adr_legal;
      ENContractItemObj.contract.org.Primechan := org.Primechan;
      }
      ENContractItemObj.contract.org := DMReports.copyOrg(org, ENContractItemObj.contract.org);
      //////////////////////////////////////////////////////////////////////////

      /// Договор //////////////////////////////////////////////////////////////
      ENContractItemObj.contract.contractNumber := contractNumber;
      ENContractItemObj.contract.contractDate := TXSDate.Create; //StrToDate(DateToStr(contractDate));
      ENContractItemObj.contract.contractDate.XSToNative(GetXSDate(contractDate));
      ENContractItemObj.contract.finDocCode := finDocCode;
      ENContractItemObj.contract.finDocID := finDocID;
      //////////////////////////////////////////////////////////////////////////
  end;

  try
    frmENContractItemEdit := TfrmENContractItemEdit.Create(Application, dsInsert);
    try
      frmENContractItemEdit.edtENContractContractName.Text := contractDescription;
      if frmENContractItemEdit.ShowModal = mrOk then
      begin
        if ENContractItemObj<>nil then
        begin
            //TempENContractItem.add(ENContractItemObj);
            if contractCode < 0 then
              contractCode := frmENContractItemEdit.contractCode;
            UpdateGrid(Sender);
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

procedure TfrmENContractItemShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmENContractItemShow.actFilterExecute(Sender: TObject);
begin
{frmENContractItemFilterEdit:=TfrmENContractItemFilterEdit.Create(Application, dsEdit);
  try
    ENContractItemFilterObj := ENContractItemFilter.Create;
    SetNullIntProps(ENContractItemFilterObj);
    SetNullXSProps(ENContractItemFilterObj);

    if frmENContractItemFilterEdit.ShowModal = mrOk then
    begin
      //FilterObject := ENContractItemFilter.Create;
      FilterObject := ENContractItemFilterObj;
      actUpdateExecute(Sender);
    end;
  finally
    frmENContractItemFilterEdit.Free;
    frmENContractItemFilterEdit:=nil;
  end;}
end;

procedure TfrmENContractItemShow.actNoFilterExecute(Sender: TObject);
begin
  FilterObject.Free;
  FilterObject := nil;
  UpdateGrid(Sender);
end;

procedure TfrmENContractItemShow.FormCreate(Sender: TObject);
begin
  contractCode := LOW_INT;
  contractDescription := '';
end;

end.