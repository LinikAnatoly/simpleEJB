
unit ShowRQPackingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient,
  ImgList,Grids, ComCtrls, ToolWin, Menus, ActnList,BaseGrid, AdvGrid, XSBuiltIns, 
  DialogFormUnit, DlgUnit, GridHeadersUnit,
  EnergyProController, EnergyProController2,
  RQPackingListController, AdvObj, TKAccountingTypeController ;


type
  TfrmRQPackingListShow = class(TChildForm)  
  HTTPRIORQPackingList: THTTPRIO;
    ImageList1: TImageList;
    sgRQPackingList: TAdvStringGrid;
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
procedure sgRQPackingListTopLeftChanged(Sender: TObject);
procedure sgRQPackingListDblClick(Sender: TObject);
procedure actViewExecute(Sender: TObject);
procedure actEditExecute(Sender: TObject);
procedure actDeleteExecute(Sender: TObject);
procedure actInsertExecute(Sender: TObject);
procedure actUpdateExecute(Sender: TObject);
procedure actFilterExecute(Sender: TObject);
procedure actNoFilterExecute(Sender: TObject);

  private
   { Private declarations }
   accountingType : TKAccountingType;
 public
   { Public declarations }
   procedure UpdateGrid(Sender: TObject);
   constructor Create(AOwner: TComponent;
                       FormMode: TFormMode;
                       accountingType: TKAccountingType; AFilter: TObject = nil); reintroduce;

 end;

implementation

uses Main, EditRQPackingList, EditRQPackingListCounters, EditRQPackingListFilter, ENConsts;


{$R *.dfm}

var
  ColCount, LastCount: Integer;
  LastRow: Integer = 1;

  RQPackingListHeaders: array [1..11] of String =
        ( 'Код'
          ,'Номер'
          ,'Дата ведомости'
          ,'Код відправника'
          ,'ФИО відправника'
          ,'Код одержувача'
          ,'ФИО одержувача'
          ,'Статус'
          ,'ФИО упаковщика'
          ,'Користувач, який вніс зміни'
          ,'Дата зміни'
        );

constructor TfrmRQPackingListShow.Create(AOwner: TComponent; FormMode: TFormMode;
                              accountingType: TKAccountingType; AFilter: TObject = nil);
begin
  if (Assigned(accountingType)) and  (accountingType.code <> Low(Integer)) then begin
	  Self.accountingType := accountingType;
  end;
  inherited Create(AOwner, FormMode, AFilter);

end;

procedure TfrmRQPackingListShow.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    inherited;
    if FormMode = fmChild then begin
      if ((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
		  case Self.accountingType.code of
			ENConsts.TK_ACCOUNTINGTYPE_TMC: frmRQPackingListMaterialsShow := nil;
			ENConsts.TK_ACCOUNTINGTYPE_COUNTER: frmRQPackingListCountersShow := nil;
			Else raise Exception.Create('Unknown type');
		  end;
	  end;
    end;
  end;


procedure TfrmRQPackingListShow.FormShow(Sender: TObject);
var
  TempRQPackingList: RQPackingListControllerSoapPort;
  i: Integer;
  RQPackingListList: RQPackingListShortList;
  begin
  SetGridHeaders(RQPackingListHeaders, sgRQPackingList.ColumnHeaders);
  ColCount:=100;
  TempRQPackingList :=  HTTPRIORQPackingList as RQPackingListControllerSoapPort;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
	 if((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
		RQPackingListFilter(FilterObject).accountingTypeRef := TKAccountingTypeRef.Create;
		RQPackingListFilter(FilterObject).accountingTypeRef.code := Self.accountingType.code;
	 end;
  end;

  RQPackingListFilter(FilterObject).orderBySQL := 'RQPACKINGLIST.DATEGEN DESC';

  RQPackingListList := TempRQPackingList.getScrollableFilteredList(RQPackingListFilter(FilterObject),0,ColCount);


  LastCount:=High(RQPackingListList.list);

  if LastCount > -1 then
     sgRQPackingList.RowCount:=LastCount+2
  else
     sgRQPackingList.RowCount:=2;

   with sgRQPackingList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListList.list[i].code <> Low(Integer) then
        Cells[0,i+1] := IntToStr(RQPackingListList.list[i].code)
        else
        Cells[0,i+1] := '';
        Cells[1,i+1] := RQPackingListList.list[i].numberGen;
        if RQPackingListList.list[i].dateGen = nil then
          Cells[2,i+1] := ''
        else
          Cells[2,i+1] := XSDate2String(RQPackingListList.list[i].dateGen);
        Cells[3,i+1] := RQPackingListList.list[i].molFromCode;
        Cells[4,i+1] := RQPackingListList.list[i].molFromName;
        Cells[5,i+1] := RQPackingListList.list[i].molToCode;
        Cells[6,i+1] := RQPackingListList.list[i].molToName;
        Cells[7,i+1] := RQPackingListList.list[i].statusRefName;
        Cells[8,i+1] := RQPackingListList.list[i].packerFIO;
        Cells[9, i+1] := RQPackingListList.list[i].userGen;
        if RQPackingListList.list[i].dateEdit = nil then
          Cells[10,i+1] := ''
        else
          Cells[10,i+1] := XSDate2String(RQPackingListList.list[i].dateEdit);
        LastRow:=i+1;
        sgRQPackingList.RowCount:=LastRow+1;
      end;
   ColCount:=ColCount+1;
   sgRQPackingList.Row:=1;
end;

procedure TfrmRQPackingListShow.sgRQPackingListTopLeftChanged(Sender: TObject);
var
  TempRQPackingList: RQPackingListControllerSoapPort;
  i,CurrentRow: Integer;
  RQPackingListList: RQPackingListShortList;
  begin
  if LastCount < 99 then Exit;
  if (sgRQPackingList.TopRow + sgRQPackingList.VisibleRowCount) = ColCount
  then
    begin
      TempRQPackingList :=  HTTPRIORQPackingList as RQPackingListControllerSoapPort;
      CurrentRow:=sgRQPackingList.RowCount;

  if FilterObject = nil then
  begin
     FilterObject := RQPackingListFilter.Create;
     SetNullIntProps(FilterObject);
     SetNullXSProps(FilterObject);
	 if((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
		RQPackingListFilter(FilterObject).accountingTypeRef := TKAccountingTypeRef.Create;
		RQPackingListFilter(FilterObject).accountingTypeRef.code := Self.accountingType.code;
	 end;
  end;

  RQPackingListFilter(FilterObject).orderBySQL := 'RQPACKINGLIST.DATEGEN DESC';

  RQPackingListList := TempRQPackingList.getScrollableFilteredList(RQPackingListFilter(FilterObject),ColCount-1, 100);



  sgRQPackingList.RowCount:=sgRQPackingList.RowCount+100;
  LastCount:=High(RQPackingListList.list);
  with sgRQPackingList do
    for i:=0 to LastCount do
      begin
        Application.ProcessMessages;
        if RQPackingListList.list[i].code <> Low(Integer) then
        Cells[0,i+CurrentRow] := IntToStr(RQPackingListList.list[i].code)
        else
        Cells[0,i+CurrentRow] := '';
        Cells[1,i+CurrentRow] := RQPackingListList.list[i].numberGen;
        if RQPackingListList.list[i].dateGen = nil then
          Cells[2,i+CurrentRow] := ''
        else
          Cells[2,i+CurrentRow] := XSDate2String(RQPackingListList.list[i].dateGen);
        Cells[3,i+CurrentRow] := RQPackingListList.list[i].molFromCode;
        Cells[4,i+CurrentRow] := RQPackingListList.list[i].molFromName;
        Cells[5,i+CurrentRow] := RQPackingListList.list[i].molToCode;
        Cells[6,i+CurrentRow] := RQPackingListList.list[i].molToName;
        Cells[7,i+CurrentRow] := RQPackingListList.list[i].statusRefName;
        Cells[8,i+CurrentRow] := RQPackingListList.list[i].packerFIO;
        Cells[9,i+CurrentRow] := RQPackingListList.list[i].userGen;
        if RQPackingListList.list[i].dateEdit = nil then
          Cells[10,i+CurrentRow] := ''
        else
          Cells[10,i+CurrentRow] := XSDate2String(RQPackingListList.list[i].dateEdit);
          LastRow:=i+CurrentRow;
      end;
   ColCount:=ColCount+100;
   sgRQPackingList.Row:=CurrentRow-5;
   sgRQPackingList.RowCount:=LastRow+1;
  end;
end;

procedure TfrmRQPackingListShow.sgRQPackingListDblClick(Sender: TObject);
Var
temp : Integer;
begin
  if FormMode = fmNormal then
  begin
    try
      temp:=StrToInt(GetReturnValue(sgRQPackingList,0));
    except
      on EConvertError do Exit;
    end;
    ModalResult:=mrOk;
  end
  else begin
    actViewExecute(Sender);
  end;
end;

procedure TfrmRQPackingListShow.UpdateGrid(Sender: TObject);
Var i, j: Integer;
begin
 for i:=1 to sgRQPackingList.RowCount-1 do
   for j:=0 to sgRQPackingList.ColCount-1 do
     sgRQPackingList.Cells[j,i]:='';
   FormShow(Sender);
end;

procedure TfrmRQPackingListShow.actViewExecute(Sender: TObject);
Var TempRQPackingList: RQPackingListControllerSoapPort;
packingList : RQPackingList;
frmPackingList : TDialogForm;
begin
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
   try
     packingList := TempRQPackingList.getObject(StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListEdit:=TfrmRQPackingListEdit.Create(Application, dsView);

  if packingList.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then begin
       frmPackingList := TfrmRQPackingListEdit.Create(Application, dsView);
       TfrmRQPackingListEdit(frmPackingList).RQPackingListObj := packingList;
  end else begin
       frmPackingList := TfrmRQPackingListCountersEdit.Create(Application, dsView);
       TfrmRQPackingListCountersEdit(frmPackingList).RQPackingListObj := packingList;
  end;
  try
    frmPackingList.ShowModal;
  finally
    frmPackingList.Free;
    frmPackingList := nil;
  end;
end;

procedure TfrmRQPackingListShow.actEditExecute(Sender: TObject);
Var TempRQPackingList: RQPackingListControllerSoapPort;
packingList : RQPackingList;
frmPackingList : TDialogForm;
begin
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
   try
     packingList := TempRQPackingList.getObject(StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]));
   except
   on EConvertError do Exit;
  end;
  frmRQPackingListEdit:=TfrmRQPackingListEdit.Create(Application, dsView);

  if packingList.accountingTypeRef.code = TK_ACCOUNTINGTYPE_TMC then begin
       frmPackingList := TfrmRQPackingListEdit.Create(Application, dsEdit);
       TfrmRQPackingListEdit(frmPackingList).RQPackingListObj := packingList;
  end else begin
       frmPackingList := TfrmRQPackingListCountersEdit.Create(Application, dsEdit);
       TfrmRQPackingListCountersEdit(frmPackingList).RQPackingListObj := packingList;
  end;
  try
    frmPackingList.ShowModal;
  finally
    frmPackingList.Free;
    frmPackingList := nil;
  end;
end;

procedure TfrmRQPackingListShow.actDeleteExecute(Sender: TObject);
Var TempRQPackingList: RQPackingListControllerSoapPort;
  ObjCode: Integer;
begin
 TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;
   try
     ObjCode := StrToInt(sgRQPackingList.Cells[0,sgRQPackingList.Row]);
   except
   on EConvertError do Exit;
  end;
  if Application.MessageBox(PChar('Вы действительно хотите удалить (Упаковочно-погрузочная ведомость) ?'),
                    PChar('Внимание !'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
  begin
      TempRQPackingList.remove(ObjCode);
      UpdateGrid(Sender);
  end;
end;

procedure TfrmRQPackingListShow.actInsertExecute(Sender: TObject);
 Var TempRQPackingList: RQPackingListControllerSoapPort;
 packingList : RQPackingList;
begin
  TempRQPackingList := HTTPRIORQPackingList as RQPackingListControllerSoapPort;  /// Это здесь уже лишнее!!!
  packingList := RQPackingList.Create;



  try
    frmRQPackingListEdit:=TfrmRQPackingListEdit.Create(Application, dsInsert);
	if((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
		frmRQPackingListEdit.cbTKAccountingType.ItemIndex := Self.accountingType.code - 1;
		frmRQPackingListEdit.DisableControls([frmRQPackingListEdit.cbTKAccountingType]);	
	end;
    frmRQPackingListEdit.RQPackingListObj := packingList;
    try
      if frmRQPackingListEdit.ShowModal = mrOk then
      begin
        if packingList <> nil then
            UpdateGrid(Sender);
      end;
    finally
      frmRQPackingListEdit.Free;
      frmRQPackingListEdit:=nil;
    end;
  finally
    packingList.Free;
  end;
end;

procedure TfrmRQPackingListShow.actUpdateExecute(Sender: TObject);
  begin
  UpdateGrid(Sender);
end;


procedure TfrmRQPackingListShow.actFilterExecute(Sender: TObject);
begin
frmRQPackingListFilterEdit:=TfrmRQPackingListFilterEdit.Create(Application, dsInsert);
  try
    RQPackingListFilterObj := RQPackingListFilter.Create;
    SetNullIntProps(RQPackingListFilterObj);
    SetNullXSProps(RQPackingListFilterObj);
    RQPackingListFilterObj.orderBySQL := 'RQPACKINGLIST.DATEGEN DESC';
    if frmRQPackingListFilterEdit.ShowModal = mrOk then
    begin
      FilterObject := RQPackingListFilterObj;
	    if((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
          RQPackingListFilter(FilterObject).accountingTypeRef := TKAccountingTypeRef.Create;
		    RQPackingListFilter(FilterObject).accountingTypeRef.code := accountingType.code;
	    end;
      actUpdateExecute(Sender);
    end;
  finally
    frmRQPackingListFilterEdit.Free;
    frmRQPackingListFilterEdit:=nil;
  end;
end;

procedure TfrmRQPackingListShow.actNoFilterExecute(Sender: TObject);
var tempConditionSQL : String;
begin
	FilterObject.Free;
	FilterObject := nil;
	FilterObject := RQPackingListFilter.Create;
	SetNullXSProps(FilterObject);
	SetNullIntProps(FilterObject);
	if((Assigned(Self.accountingType)) and (Self.accountingType.code <> Low(Integer))) then begin
    RQPackingListFilter(FilterObject).accountingTypeRef := TKAccountingTypeRef.Create;
		RQPackingListFilter(FilterObject).accountingTypeRef.code := accountingType.code;
	end;
	RQPackingListFilter(FilterObject).orderBySQL := 'RQPACKINGLIST.DATEGEN DESC';
	UpdateGrid(Sender);
end;

end.